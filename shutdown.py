"""
Myo Shutdown Utility

Powers off all Myos (deep sleep mode).
Myos will NOT wake from gestures - requires USB charging to turn back on.

Usage:
    source .venv/bin/activate
    python shutdown.py
"""

import time
import threading
from pyomyo import Myo
import re
from serial.tools.list_ports import comports

# Myo MAC Addresses (DECIMAL format)
# Run: python scan.py to find your MAC addresses
# Keep synchronized with pyomyosc.py
#
# Examples:
#   Single Myo:   [[255, 201, 227, 231, 151, 241]]
#   Multiple Myos: [[mac1], [mac2], ...] (each requires its own USB dongle)

# MYO_MAC_ADDRESSES = []

# Your MAC addresses (uncomment to use):
MYO_MAC_ADDRESSES = [
    [255, 201, 227, 231, 151, 241],  # Myo 1
    [245, 95, 150, 54, 93, 223],     # Myo 2
]

def detect_dongles():
    """Detect all available Myo dongles by USB vendor/product ID"""
    return [p[0] for p in comports() if re.search(r'PID=2458:0*1', p[2])]


def connect_myo(myo_index, mac_addr, dongle, results, events):
    """Connect to a single Myo (parallel worker)"""
    try:
        print(f"Myo {myo_index}: Connecting...")
        m = Myo(tty=dongle)
        m.connect(mac_addr)
        print(f"Myo {myo_index}: Connected!")

        # Vibrate once to confirm connection
        m.vibrate(1)

        results[myo_index] = m
        events[myo_index].set()
    except Exception as e:
        print(f"Myo {myo_index}: ERROR - {e}")
        events[myo_index].set()


def poweroff_myo(myo):
    """Send power_off commands continuously until Myo powers off"""
    try:
        while True:
            myo.power_off()
            time.sleep(0.1)
    except:
        pass


# ==================== MAIN ====================

print("=" * 60)
print("Myo Shutdown Utility")
print("=" * 60)

# Detect hardware
dongles = detect_dongles()
print(f"\nDetected {len(dongles)} Bluetooth dongle(s)")

if len(dongles) < len(MYO_MAC_ADDRESSES):
    print(f"\nERROR: Need {len(MYO_MAC_ADDRESSES)} dongle(s) but only found {len(dongles)}")
    exit(1)

# Connect to all Myos in parallel
print(f"\nConnecting to {len(MYO_MAC_ADDRESSES)} Myo(s)...\n")

myos = {}
events = {}
threads = []

for i in range(1, len(MYO_MAC_ADDRESSES) + 1):
    events[i] = threading.Event()

# Start all connection threads
for i, (mac_addr, dongle) in enumerate(zip(MYO_MAC_ADDRESSES, dongles), 1):
    thread = threading.Thread(
        target=connect_myo,
        args=(i, mac_addr, dongle, myos, events),
        daemon=True
    )
    thread.start()
    threads.append(thread)

# Wait for all connections
for i in range(1, len(MYO_MAC_ADDRESSES) + 1):
    events[i].wait(timeout=5)

# Check results
if not myos:
    print("\nERROR: No Myos connected. Exiting...")
    exit(1)

# Power off sequence
print("\n" + "=" * 60)
print(f"Powering off {len(myos)} Myo(s)...")
print("Note: Myos require USB charging cable to turn back on")
print("=" * 60 + "\n")

time.sleep(0.5)

# Start poweroff threads for all connected Myos
for myo_index, m in myos.items():
    t = threading.Thread(target=poweroff_myo, args=(m,), daemon=True)
    t.start()
    print(f"Myo {myo_index}: Sending poweroff commands...")

print(f"\nPress Ctrl+C when all {len(myos)} Myo(s) are off")

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    print(f"\nDone! {len(myos)} Myo(s) should be powered off.")
