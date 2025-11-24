"""
Myo MAC Address Scanner
Run this once to find MAC addresses, then add them to pyomyosc.py

Usage:
    source .venv/bin/activate
    python scan.py
"""

from pyomyo.pyomyo import BT, multiord
import serial.tools.list_ports as list_ports
import time
import re

def detect_dongles():
    """Detect all available Myo dongles"""
    return [p[0] for p in list_ports.comports() if re.search(r'PID=2458:0*1', p[2])]

print("=" * 60)
print("Myo MAC Address Scanner")
print("=" * 60)

# Detect dongles
dongles = detect_dongles()

if not dongles:
    print("\nERROR: No Myo dongles found")
    print("Make sure USB dongle(s) are plugged in")
    exit(1)

print(f"\nDetected {len(dongles)} Bluetooth dongle(s):")
for dongle in dongles:
    print(f"  {dongle}")

print("\nMake sure all Myos are powered on.")
print("Scanning...\n")

# Scan for Myos using first dongle
bt = BT(dongles[0])
bt.discover()

found_myos = []
start_time = time.time()
scan_duration = 2

while time.time() - start_time < scan_duration:
    p = bt.recv_packet()

    # Check if packet is from a Myo
    if p.payload.endswith(b'\x06\x42\x48\x12\x4A\x7F\x2C\x48\x47\xB9\xDE\x04\xA9\x01\x00\x06\xD5'):
        mac = list(multiord(p.payload[2:8]))
        if mac not in found_myos:
            found_myos.append(mac)
            mac_hex = ':'.join([f"{b:02x}" for b in mac])
            print(f"  > Myo #{len(found_myos)}")
            print(f"    MAC (hex): {mac_hex}")
            print(f"    MAC (dec): {mac}\n")

bt.end_scan()

# Results
print("=" * 60)
print(f"Scan complete: Found {len(found_myos)} Myo(s)")
print("=" * 60)

if found_myos:
    print("\nCopy this to MYO_MAC_ADDRESSES in pyomyosc.py:\n")
    print(f"MYO_MAC_ADDRESSES = {found_myos}")
    print("\n" + "=" * 60)
else:
    print("\nNo Myos found. Check:")
    print("  - Myos are powered on")
    print("  - Myos are within range")
    print("  - Try running scan again")
