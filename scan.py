"""
Myo MAC Address Scanner
Run this once to find MAC addresses, then add them to pyomyosc.py

Usage:
    source .venv/bin/activate
    python3 scan.py
"""

from pyomyo.pyomyo import BT, multiord
import serial.tools.list_ports as list_ports
import time

print("=" * 60)
print("Myo MAC Address Scanner")
print("=" * 60)
print("\nMake sure all Myos are powered on")
print("Scanning...\n")

# Find Myo dongle
tty = None
for p in list_ports.comports():
    if '2458:0001' in p[2]:
        tty = p[0]
        print(f"Found dongle: {tty}\n")
        break

if not tty:
    print("ERROR: Myo dongle not found")
    print("Make sure USB dongle is plugged in")
    exit(1)

# Scan for Myos
bt = BT(tty)
bt.discover()

found_myos = []
start_time = time.time()

while time.time() - start_time < 4: # Scan for 4 seconds
    p = bt.recv_packet()

    # Check if packet is from a Myo
    if p.payload.endswith(b'\x06\x42\x48\x12\x4A\x7F\x2C\x48\x47\xB9\xDE\x04\xA9\x01\x00\x06\xD5'):
        mac = list(multiord(p.payload[2:8]))
        if mac not in found_myos:
            found_myos.append(mac)
            mac_hex = ':'.join([f"{b:02x}" for b in mac])
            mac_dec = str(mac)
            print(f"  Found Myo #{len(found_myos)}")
            print(f"    Hex: {mac_hex}")
            print(f"    Dec: {mac_dec}")

bt.end_scan()

print("\n" + "=" * 60)
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
