"""
Myo Power Off Utility

Powers off the Myo completely (deep sleep).
The Myo will NOT wake from gestures or movement.
To turn it back on, you must plug in USB charging cable.

Usage:
    python poweroff.py

Press Ctrl+C when done.
"""

import time
from pyomyo import Myo, emg_mode

print("=" * 60)
print("Myo Power Off Utility")
print("=" * 60)
print("\nSearching for Myo...")

# Connect to Myo (no data mode for faster connection)
m = Myo(mode=emg_mode.NO_DATA)
m.connect()

print("Connected to Myo")
print("\nPowering off Myo...")
print("Note: Myo requires USB charging cable to turn back on")
print("\nPress Ctrl+C to exit\n")

# Vibrate to confirm
m.vibrate(2)
time.sleep(1)

# Send poweroff command repeatedly
try:
    while True:
        m.power_off()
        time.sleep(0.1)
except KeyboardInterrupt:
    print("\nPoweroff sent. Myo is shutting down.")
