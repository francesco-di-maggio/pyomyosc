"""
pyomyosc - Unified Myo OSC Bridge
Connects to one or more Myo armbands and streams data via OSC

Single Myo Mode:
    Leave MYO_MAC_ADDRESSES = [] empty
    Connects to first available Myo
    Streams on /myo/1/* addresses

Multi Myo Mode:
    Specify MAC addresses in MYO_MAC_ADDRESSES list
    Connects to specific Myos in specified order
    Streams on /myo/1/*, /myo/2/*, /myo/3/* addresses
    Each Myo vibrates on connection to identify itself

Outgoing OSC (port 8000):
    /myo/N/emg - 8-channel EMG data
    /myo/N/quat - Quaternion orientation
    /myo/N/accel - Accelerometer
    /myo/N/gyro - Gyroscope
    /myo/N/battery - Battery level
    /myo/N/pose - Gesture detection (rest, fist, wave_in, etc.)
    /myo/N/arm - Arm detection (left/right, toward_wrist/toward_elbow)

Incoming OSC Commands (port 8001, optional):
    /myo/N/vibrate [1-3] - Trigger vibration
    /myo/N/led [r g b] - Set LED color (RGB 0-255)

Usage:
    source venv/bin/activate  # Activate virtual environment
    python3 pyomyosc.py
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

# Myo MAC Addresses
# Leave empty to connect to any available Myo
# Or specify MAC addresses for multiple Myos:
MYO_MAC_ADDRESSES = []

# Example with multiple Myos (specify MAC addresses):
# MYO_MAC_ADDRESSES = [
#     [255, 201, 227, 231, 151, 241],  # Myo 1 - e.g., left arm
#     [147, 123, 98, 76, 54, 32],       # Myo 2 - e.g., right arm
# ]

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
print("pyomyosc - Myo OSC Bridge")
print("=" * 60)
print(f"OSC target: {OSC_IP}:{OSC_PORT}")
print(f"EMG Mode: {EMG_MODE.name}")
print("=" * 60)

# Initialize OSC client
osc_client = udp_client.SimpleUDPClient(OSC_IP, OSC_PORT)

# Track connected Myos
myos = []
myo_threads = []
command_queue = queue.Queue()


def format_mac(mac_list):
    """Convert MAC address list to readable string"""
    return ':'.join([f"{b:02x}" for b in mac_list])


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
            pose_str = str(pose).split('.')[1] if '.' in str(pose) else str(pose)
            pose_str = pose_str.lower()  # Convert to lowercase
            osc_client.send_message(f"/myo/{myo_index}/pose", pose_str)

    def send_arm(arm, xdir):
        if SEND_ARM:
            arm_str = str(arm).split('.')[1] if '.' in str(arm) else str(arm)
            xdir_str = str(xdir).split('.')[1] if '.' in str(xdir) else str(xdir)
            arm_str = arm_str.lower()  # Convert to lowercase
            xdir_str = xdir_str.lower()  # Convert to lowercase
            osc_client.send_message(f"/myo/{myo_index}/arm", [arm_str, xdir_str])

    return send_emg, send_imu, send_battery, send_pose, send_arm


def handle_vibrate(address, *args):
    """Handle incoming /myo/N/vibrate command from Max"""
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
    """Handle incoming /myo/N/led command from Max"""
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
    dispatcher.map("/myo/*/vibrate", handle_vibrate)
    dispatcher.map("/myo/*/led", handle_led)

    server = BlockingOSCUDPServer(("0.0.0.0", OSC_COMMAND_PORT), dispatcher)
    print(f"OSC command receiver listening on port {OSC_COMMAND_PORT}")
    print("  Send /myo/N/vibrate [1-3] to trigger vibration")
    print("  Send /myo/N/led [r g b] to set LED color\n")

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
                print(f"Myo {myo_index}: Connecting to {format_mac(mac_addr)}...")
            m.connect(mac_addr)
        else:
            if DEBUG_CONNECTION:
                print(f"Myo {myo_index}: Scanning for device...")
            m.connect()

        if DEBUG_CONNECTION:
            print(f"Myo {myo_index}: Connected!")

        # Vibrate N times to identify which Myo this is
        m.vibrate(myo_index)
        time.sleep(0.5)

        # Store Myo instance
        myos.append((myo_index, m))

        # Create and register handlers
        handlers = create_handlers(myo_index)
        m.add_emg_handler(handlers[0])
        m.add_imu_handler(handlers[1])
        m.add_battery_handler(handlers[2])
        m.add_pose_handler(handlers[3])
        m.add_arm_handler(handlers[4])

        # Main loop (battery will be reported when Myo sends update)
        while True:
            # Process any queued OSC commands for this Myo
            while not command_queue.empty():
                try:
                    cmd = command_queue.get_nowait()
                    if cmd[1] == myo_index:  # Check if command is for this Myo
                        if cmd[0] == 'vibrate':
                            intensity = cmd[2]
                            m.vibrate(intensity)
                            if DEBUG_COMMANDS:
                                print(f"Executed: Myo {myo_index} vibrate {intensity}")
                        elif cmd[0] == 'led':
                            logo_color = cmd[2]
                            bar_color = cmd[3]
                            m.set_leds(logo_color, bar_color)
                            if DEBUG_COMMANDS:
                                print(f"Executed: Myo {myo_index} LED {logo_color}")
                    else:
                        # Put it back if not for this Myo
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


# ==================== MAIN ====================

try:
    # Determine number of Myos
    if not MYO_MAC_ADDRESSES:
        print("\nMode: Single Myo (auto-connect to first available)")
        num_myos = 1
        MYO_MAC_ADDRESSES = [None]  # Single Myo, no MAC specified
    else:
        print(f"\nMode: {len(MYO_MAC_ADDRESSES)} Myo(s) with specified MAC addresses")
        num_myos = len(MYO_MAC_ADDRESSES)
        print("\nEach Myo will vibrate to identify itself:")
        print("  1 vibration  = Myo 1")
        print("  2 vibrations = Myo 2")
        print("  3 vibrations = Myo 3, etc.")

    # Start OSC command server if enabled
    if ENABLE_OSC_COMMANDS:
        start_osc_server()

    # Connect to each Myo in separate threads
    print(f"\nConnecting to {len(MYO_MAC_ADDRESSES)} Myo(s)...\n")

    for i, mac_addr in enumerate(MYO_MAC_ADDRESSES, 1):
        thread = threading.Thread(target=myo_worker, args=(i, mac_addr), daemon=True)
        thread.start()
        myo_threads.append(thread)
        time.sleep(2)  # Give each Myo time to connect

    print("\n" + "=" * 60)
    print("Connected! Streaming OSC data...")
    print("=" * 60)

    # Show outgoing data streams
    print("\nOutgoing data (port {}):".format(OSC_PORT))
    if len(MYO_MAC_ADDRESSES) == 1:
        print("  /myo/1/emg      - 8-channel EMG data")
        print("  /myo/1/quat     - Quaternion orientation")
        print("  /myo/1/accel    - Accelerometer")
        print("  /myo/1/gyro     - Gyroscope")
        print("  /myo/1/battery  - Battery level")
        print("  /myo/1/pose     - Gesture detection")
        print("  /myo/1/arm      - Arm detection")
    else:
        print("  /myo/N/emg, /myo/N/quat, /myo/N/accel, /myo/N/gyro")
        print("  /myo/N/battery, /myo/N/pose, /myo/N/arm")
        print("  (N = 1, 2, 3, etc.)")

    # Show incoming commands if enabled
    if ENABLE_OSC_COMMANDS:
        print("\nIncoming commands (port {}):".format(OSC_COMMAND_PORT))
        if len(MYO_MAC_ADDRESSES) == 1:
            print("  /myo/1/vibrate [1-3]  - Trigger vibration")
            print("  /myo/1/led [r g b]    - Set LED color")
        else:
            print("  /myo/N/vibrate [1-3]  - Trigger vibration")
            print("  /myo/N/led [r g b]    - Set LED color")

    print("\n" + "=" * 60)
    print("Press Ctrl+C to stop")
    print("=" * 60 + "\n")

    # Keep main thread alive
    while True:
        time.sleep(1)

except KeyboardInterrupt:
    print("\n\nStopping...")

    # Vibrate and disconnect all Myos
    for myo_index, m in myos:
        try:
            m.vibrate(1)
            m.disconnect()
        except:
            pass

    print("Disconnected.")

except Exception as e:
    print(f"\nError: {e}")
