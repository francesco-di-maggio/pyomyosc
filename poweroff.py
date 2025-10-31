"""
Myo Power Off Utility

Powers off all Myos (deep sleep mode).
Myos will NOT wake from gestures - requires USB charging to turn back on.

Usage:
    source venv/bin/activate
    python3 poweroff.py
"""

import time
import threading
from pyomyo import Myo
import re
from serial.tools.list_ports import comports

# Myo MAC Addresses (DECIMAL format)
# Run: python3 scan.py to find your MAC addresses
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
    dongles = []
    for p in comports():
        if re.search(r'PID=2458:0*1', p[2]):  # Thalmic Labs Myo dongle
            dongles.append(p[0])
    return dongles

print("=" * 60)
print("Myo Power Off Utility")
print("=" * 60)

dongles = detect_dongles()
print(f"\nDetected {len(dongles)} Bluetooth dongle(s)")

if len(dongles) < len(MYO_MAC_ADDRESSES):
    print(f"\nERROR: Need {len(MYO_MAC_ADDRESSES)} dongle(s) but only found {len(dongles)}")
    exit(1)

myos = []
for i, mac_addr in enumerate(MYO_MAC_ADDRESSES, 1):
    try:
        print(f"\nConnecting to Myo {i}...")
        m = Myo(tty=dongles[i-1])
        m.connect(mac_addr)
        print(f"  Connected!")

        # Vibrate once to confirm connection
        m.vibrate(1)
        time.sleep(0.3)

        myos.append((i, m))
    except Exception as e:
        print(f"  ERROR: {e}")
        exit(1)

print("\n" + "=" * 60)
print(f"Powering off {len(myos)} Myo(s)...")
print("Note: Myos require USB charging cable to turn back on")
print("=" * 60 + "\n")

time.sleep(1)

def poweroff_myo(myo):
    """Send power_off commands continuously until interrupted"""
    try:
        while True:
            myo.power_off()
            time.sleep(0.1)
    except:
        pass

# Start thread for each Myo to send poweroff simultaneously
for myo_index, m in myos:
    t = threading.Thread(target=poweroff_myo, args=(m,), daemon=True)
    t.start()
    print(f"Myo {myo_index}: Sending poweroff commands...")

print("\nPress Ctrl+C when both Myos are off")

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    print(f"\nDone! {len(myos)} Myo(s) should be powered off.")
