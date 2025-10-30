"""
Multi-Myo to OSC Bridge
Connects to multiple Myo armbands and streams all data via OSC with indexed addresses

OSC Address Format: /myo/INDEX/parameter
Examples:
  - /myo/1/emg - EMG from first Myo
  - /myo/2/quat - Quaternion from second Myo
  - /myo/1/battery - Battery from first Myo

OSC Commands (incoming, optional):
  - /myo/1/vibrate [1-3] - Trigger vibration on Myo 1
  - /myo/2/led [r g b] - Set LED color on Myo 2

Usage:
    python multi_myo_to_osc.py

Configuration:
    Edit MYO_MAC_ADDRESSES list below with your Myo MAC addresses
    Leave empty [] to auto-discover Myos

How to find MAC addresses:
    Run this script once with empty list, it will scan and show MAC addresses
"""

from pyomyo import Myo, emg_mode
from pythonosc import udp_client
from pythonosc.dispatcher import Dispatcher
from pythonosc.osc_server import BlockingOSCUDPServer
import threading
import time
import queue

# ==================== CONFIGURATION ====================

# OSC Configuration
OSC_IP = "127.0.0.1"
OSC_PORT = 8000           # Port for outgoing data

# OSC Commands (incoming from Max)
ENABLE_OSC_COMMANDS = True   # Set to False to disable command receiver
OSC_COMMAND_PORT = 8001      # Port for incoming commands from Max

# EMG Mode Selection (choose one)
# EMG_MODE = emg_mode.PREPROCESSED  # 0-1024, 50Hz (envelope-like)
EMG_MODE = emg_mode.FILTERED      # -128 to 127, 200Hz (clean audio)
# EMG_MODE = emg_mode.RAW           # -128 to 127, 200Hz (noisy audio)

# Myo MAC Addresses (leave empty to auto-discover!):
# MYO_MAC_ADDRESSES = []

# Format: [[MAC1], [MAC2], ...]
# Example: [[93, 41, 55, 245, 82, 194], [12, 34, 56, 78, 90, 12]]
MYO_MAC_ADDRESSES = [[255, 201, 227, 231, 151, 241]]

# Enable/Disable Data Streams
SEND_EMG = True           # 8-channel EMG data
SEND_IMU = True           # Quaternion, accelerometer, gyroscope
SEND_BATTERY = True       # Battery level
SEND_POSE = True          # Gesture detection
SEND_ARM = True           # Arm detection (left/right)

# Debug Output (set to True to see data in terminal)
DEBUG_CONNECTION = False  # Show connection messages and battery updates
DEBUG_COMMANDS = False    # Show incoming OSC commands

# =======================================================

print("=" * 60)
print("Multi-Myo to OSC Bridge")
print("=" * 60)
print(f"OSC target: {OSC_IP}:{OSC_PORT}")
print(f"EMG Mode: {EMG_MODE.name}")
print("=" * 60)

# Initialize OSC client
osc_client = udp_client.SimpleUDPClient(OSC_IP, OSC_PORT)

# Track connected Myos
myos = []
myo_threads = []


def create_handlers(myo_index):
    """Create OSC handler functions for a specific Myo index"""

    def send_emg(emg, movement):
        if SEND_EMG:
            osc_client.send_message(f"/myo/{myo_index}/emg", list(emg))

    def send_imu(quat, accel, gyro):
        if SEND_IMU:
            osc_client.send_message(f"/myo/{myo_index}/quat", list(quat))
            osc_client.send_message(f"/myo/{myo_index}/accel", list(accel))
            osc_client.send_message(f"/myo/{myo_index}/gyro", list(gyro))

    def send_battery(battery_level):
        if SEND_BATTERY:
            osc_client.send_message(f"/myo/{myo_index}/battery", battery_level)
            if DEBUG_CONNECTION:
                print(f"Myo {myo_index} battery: {battery_level}%")

    def send_pose(pose):
        if SEND_POSE:
            osc_client.send_message(f"/myo/{myo_index}/pose", pose.name.lower())

    def send_arm(arm, xdir):
        if SEND_ARM:
            osc_client.send_message(f"/myo/{myo_index}/arm", [arm.name.lower(), xdir.name.lower()])

    return send_emg, send_imu, send_battery, send_pose, send_arm


# ==================== OSC COMMAND HANDLERS ====================

# Command queue (thread-safe communication between OSC thread and Myo threads)
command_queue = queue.Queue()

def handle_vibrate(address, *args):
    """
    Handle incoming /myo/N/vibrate command from Max

    Args:
        address: OSC address (e.g., /myo/1/vibrate)
        args[0]: intensity (Vibration intensity: 1=short, 2=medium, 3=long)
    """
    try:
        if len(args) < 1:
            print(f"Vibrate: missing intensity argument (send /myo/N/vibrate [1-3])")
            return

        # Extract myo index from address: /myo/1/vibrate -> 1
        myo_index = int(address.split('/')[2])
        intensity = int(args[0])

        if 1 <= intensity <= 3:
            command_queue.put(('vibrate', myo_index, intensity))
            if DEBUG_COMMANDS:
                print(f"Command queued: Myo {myo_index} vibrate {intensity}")
        else:
            print(f"Vibrate: invalid intensity {intensity} (must be 1-3)")
    except Exception as e:
        print(f"Vibrate error: {e}")


def handle_led(address, *args):
    """
    Handle incoming /myo/N/led command from Max

    Args:
        address: OSC address (e.g., /myo/1/led)
        args: r, g, b RGB values (0-255) for both logo and bar LEDs
              or r1, g1, b1, r2, g2, b2 for separate logo/bar colors
    """
    try:
        if len(args) < 3:
            print(f"LED: invalid arguments (send /myo/N/led [r g b])")
            return

        # Extract myo index from address: /myo/1/led -> 1
        myo_index = int(address.split('/')[2])

        if len(args) == 3:
            # Same color for both LEDs
            r, g, b = [int(v) for v in args]
            command_queue.put(('led', myo_index, [r, g, b], [r, g, b]))
            if DEBUG_COMMANDS:
                print(f"Command queued: Myo {myo_index} LED RGB({r}, {g}, {b})")
        elif len(args) == 6:
            # Separate colors for logo and bar
            r1, g1, b1, r2, g2, b2 = [int(v) for v in args]
            command_queue.put(('led', myo_index, [r1, g1, b1], [r2, g2, b2]))
            if DEBUG_COMMANDS:
                print(f"Command queued: Myo {myo_index} LED Logo RGB({r1}, {g1}, {b1}), Bar RGB({r2}, {g2}, {b2})")
        else:
            print(f"LED: invalid args (need 3 or 6 values, got {len(args)})")
    except Exception as e:
        print(f"LED error: {e}")


def start_osc_server():
    """Start OSC server in background thread to receive commands from Max"""
    dispatcher = Dispatcher()
    # Map with wildcard for myo index: /myo/1/vibrate, /myo/2/vibrate, etc.
    dispatcher.map("/myo/*/vibrate", handle_vibrate)
    dispatcher.map("/myo/*/led", handle_led)

    server = BlockingOSCUDPServer(("0.0.0.0", OSC_COMMAND_PORT), dispatcher)
    print(f"OSC command receiver listening on port {OSC_COMMAND_PORT}")
    print("  Send /myo/N/vibrate [1-3] to trigger vibration")
    print("  Send /myo/N/led [r g b] to set LED color\n")

    # Run server in background thread
    server_thread = threading.Thread(target=server.serve_forever, daemon=True)
    server_thread.start()
    return server


def myo_worker(myo_index, mac_addr=None):
    """Worker thread for a single Myo"""
    try:
        # Create Myo instance
        m = Myo(mode=EMG_MODE)

        # Connect
        if mac_addr:
            if DEBUG_CONNECTION:
                print(f"Myo {myo_index}: Connecting to MAC {mac_addr}...")
            m.connect(mac_addr)
        else:
            if DEBUG_CONNECTION:
                print(f"Myo {myo_index}: Scanning for device...")
            m.connect()

        if DEBUG_CONNECTION:
            print(f"Myo {myo_index}: Connected!")

        # Vibrate N times to identify which Myo this is (LED stays at default)
        m.vibrate(myo_index)

        # Create and register handlers
        emg_h, imu_h, bat_h, pose_h, arm_h = create_handlers(myo_index)

        if SEND_EMG:
            m.add_emg_handler(emg_h)
        if SEND_IMU:
            m.add_imu_handler(imu_h)
        if SEND_BATTERY:
            m.add_battery_handler(bat_h)
        if SEND_POSE:
            m.add_pose_handler(pose_h)
        if SEND_ARM:
            m.add_arm_handler(arm_h)

        # Store Myo instance
        myos.append((myo_index, m))  # Store with index for command routing

        # Main loop
        while True:
            # Process any queued OSC commands for this Myo
            while not command_queue.empty():
                try:
                    cmd = command_queue.get_nowait()
                    # Check if command is for this Myo
                    if cmd[0] == 'vibrate' and cmd[1] == myo_index:
                        intensity = cmd[2]
                        m.vibrate(intensity)
                        if DEBUG_COMMANDS:
                            print(f"Executed: Myo {myo_index} vibrate {intensity}")
                    elif cmd[0] == 'led' and cmd[1] == myo_index:
                        logo_color = cmd[2]
                        bar_color = cmd[3]
                        m.set_leds(logo_color, bar_color)
                        if DEBUG_COMMANDS:
                            print(f"Executed: Myo {myo_index} LED {logo_color}")
                    else:
                        # Put it back if not for us
                        command_queue.put(cmd)
                        break
                except queue.Empty:
                    break
                except Exception as e:
                    print(f"Command execution error: {e}")

            # Run Myo data loop
            m.run()

    except Exception as e:
        print(f"Myo {myo_index} error: {e}")


def scan_myos():
    """Scan for available Myos and return their MAC addresses"""
    print("\nScanning for Myo devices...")
    print("This will show MAC addresses of all nearby Myos")
    print("Add them to MYO_MAC_ADDRESSES in the script\n")

    from pyomyo.pyomyo import BT, multiord
    import serial.tools.list_ports as list_ports

    # Find dongle
    for p in list_ports.comports():
        if '2458:0001' in p[2]:
            tty = p[0]
            print(f"Found dongle: {tty}")
            break
    else:
        print("No Myo dongle found!")
        return []

    bt = BT(tty)
    bt.discover()

    found_myos = []
    print("\nScanning for 10 seconds...\n")

    start_time = time.time()
    while time.time() - start_time < 10:
        p = bt.recv_packet()
        # Check if it's a Myo (signature in payload)
        if p.payload.endswith(b'\x06\x42\x48\x12\x4A\x7F\x2C\x48\x47\xB9\xDE\x04\xA9\x01\x00\x06\xD5'):
            mac = list(multiord(p.payload[2:8]))
            if mac not in found_myos:
                found_myos.append(mac)
                print(f"Found Myo: {mac}")

    bt.end_scan()

    print(f"\nFound {len(found_myos)} Myo(s)")
    if found_myos:
        print("\nAdd these to MYO_MAC_ADDRESSES:")
        print(f"MYO_MAC_ADDRESSES = {found_myos}")

    return found_myos


# ==================== MAIN ====================

if __name__ == '__main__':
    try:
        # If no MAC addresses specified, scan
        if not MYO_MAC_ADDRESSES:
            print("\nNo MAC addresses configured.")
            print("Scanning for Myos...\n")
            found = scan_myos()

            if not found:
                print("\nNo Myos found. Make sure they are powered on.")
                exit(1)

            print("\nEdit multi_myo_to_osc.py and add the MAC addresses, then run again.")
            exit(0)

        # Start OSC command server if enabled
        osc_server = None
        if ENABLE_OSC_COMMANDS:
            osc_server = start_osc_server()

        # Start a thread for each Myo
        print(f"\nConnecting to {len(MYO_MAC_ADDRESSES)} Myo(s)...\n")

        for idx, mac in enumerate(MYO_MAC_ADDRESSES, start=1):
            thread = threading.Thread(target=myo_worker, args=(idx, mac), daemon=True)
            thread.start()
            myo_threads.append(thread)
            time.sleep(2)  # Delay between connections

        print("\n" + "=" * 60)
        print("All Myos connected! Streaming via OSC...")
        print("Press Ctrl+C to stop")
        print("=" * 60 + "\n")

        # Keep main thread alive
        while True:
            time.sleep(1)

    except KeyboardInterrupt:
        print("\n\nStopping...")

        # Vibrate and disconnect all Myos (LED stays unchanged)
        for myo_index, m in myos:
            try:
                m.vibrate(1)
                m.disconnect()
            except:
                pass

        print("Disconnected.")
