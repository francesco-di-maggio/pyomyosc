"""
pyomyosc - Unified Myo OSC Bridge
Connects to one or more Myo armbands and streams data via OSC

Setup:
    1. Run: python scan.py (to find MAC addresses in decimal format)
    2. Edit MYO_MAC_ADDRESSES in this file
    3. Run: python pyomyosc.py

Configuration:
    MYO_MAC_ADDRESSES = [[255, 201, 227, 231, 151, 241]]  # Single Myo
    MYO_MAC_ADDRESSES = [[mac1], [mac2]]                  # Multiple Myos

    Each Myo requires its own USB Bluetooth dongle
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
    source .venv/bin/activate
    python pyomyosc.py
"""

from pyomyo import Myo, emg_mode
from pythonosc import udp_client
from pythonosc.dispatcher import Dispatcher
from pythonosc.osc_server import BlockingOSCUDPServer
import threading
import time
import queue
import re
from serial.tools.list_ports import comports

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

# Myo MAC Addresses (DECIMAL format)
# Run: python scan.py to find your MAC addresses
# Examples:
#   Single Myo:   [[255, 201, 227, 231, 151, 241]]
#   Multiple Myos: [[mac1], [mac2], ...] (each requires its own USB dongle)

# MYO_MAC_ADDRESSES = []

# Your MAC addresses (uncomment to use):
MYO_MAC_ADDRESSES = [
    [255, 201, 227, 231, 151, 241],  # Myo 1
    [245, 95, 150, 54, 93, 223],     # Myo 2
]

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

print("\n" + "=" * 60)
print("pyomyosc - Myo OSC Bridge")
print("=" * 60)
print(f"OSC target: {OSC_IP}:{OSC_PORT}")
print(f"EMG Mode: {EMG_MODE.name}")
print("=" * 60)

# Initialize OSC client
osc_client = udp_client.SimpleUDPClient(OSC_IP, OSC_PORT)

# Track connected Myos
myos = []
command_queues = {}  # Dictionary of queues, one per Myo index
connection_events = {}  # Events to signal when each Myo is connected
shutdown_event = threading.Event()  # Signal for clean shutdown


def detect_dongles():
    """Detect all available Myo dongles by USB vendor/product ID"""
    return [p[0] for p in comports() if re.search(r'PID=2458:0*1', p[2])]


def clamp_rgb(value):
    """Clamp RGB value to valid range 0-255"""
    return max(0, min(255, int(value)))


def get_myo_index(address):
    """Extract Myo index from OSC address (e.g., /myo/1/vibrate -> 1)"""
    return int(address.split('/')[2])


def parse_enum_name(enum_value):
    """Extract lowercase name from enum (e.g., 'Pose.FIST' -> 'fist')"""
    name = str(enum_value).split('.')[1] if '.' in str(enum_value) else str(enum_value)
    return name.lower()


def create_handlers(myo_index):
    """Create OSC handler functions for a specific Myo index"""

    # Pre-compute OSC addresses for performance (EMG runs at 200Hz)
    emg_addr = f"/myo/{myo_index}/emg"
    quat_addr = f"/myo/{myo_index}/quat"
    accel_addr = f"/myo/{myo_index}/accel"
    gyro_addr = f"/myo/{myo_index}/gyro"
    battery_addr = f"/myo/{myo_index}/battery"
    pose_addr = f"/myo/{myo_index}/pose"
    arm_addr = f"/myo/{myo_index}/arm"

    def send_emg(emg, movement):
        if SEND_EMG:
            osc_client.send_message(emg_addr, list(emg))

    def send_imu(quat, accel, gyro):
        if SEND_IMU:
            osc_client.send_message(quat_addr, list(quat))
            osc_client.send_message(accel_addr, list(accel))
            osc_client.send_message(gyro_addr, list(gyro))

    def send_battery(battery_level):
        if SEND_BATTERY:
            osc_client.send_message(battery_addr, battery_level)
            if DEBUG_CONNECTION:
                print(f"Myo {myo_index} battery: {battery_level}%")

    def send_pose(pose):
        if SEND_POSE:
            osc_client.send_message(pose_addr, parse_enum_name(pose))

    def send_arm(arm, xdir):
        if SEND_ARM:
            osc_client.send_message(arm_addr, [parse_enum_name(arm), parse_enum_name(xdir)])

    return send_emg, send_imu, send_battery, send_pose, send_arm


def handle_vibrate(address, *args):
    """Handle incoming /myo/N/vibrate command from Max"""
    try:
        if len(args) < 1:
            print("Vibrate: missing intensity (send /myo/N/vibrate [1-3])")
            return

        myo_index = get_myo_index(address)
        intensity = int(args[0])

        if not (1 <= intensity <= 3):
            print(f"Vibrate: invalid intensity {intensity} (must be 1-3)")
            return

        if myo_index not in command_queues:
            print(f"Vibrate: Myo {myo_index} not connected")
            return

        command_queues[myo_index].put(('vibrate', intensity))
        if DEBUG_COMMANDS:
            print(f"Command queued: Myo {myo_index} vibrate {intensity}")
    except Exception as e:
        print(f"Vibrate error: {e}")


def handle_led(address, *args):
    """Handle incoming /myo/N/led command from Max"""
    try:
        if len(args) < 3:
            print("LED: invalid arguments (send /myo/N/led [r g b])")
            return

        myo_index = get_myo_index(address)

        if myo_index not in command_queues:
            print(f"LED: Myo {myo_index} not connected")
            return

        if len(args) == 3:
            # Same color for both logo and bar LEDs
            rgb = [clamp_rgb(v) for v in args]
            command_queues[myo_index].put(('led', rgb, rgb))
            if DEBUG_COMMANDS:
                print(f"Command queued: Myo {myo_index} LED RGB{tuple(rgb)}")
        elif len(args) == 6:
            # Separate colors for logo and bar LEDs
            logo = [clamp_rgb(v) for v in args[:3]]
            bar = [clamp_rgb(v) for v in args[3:]]
            command_queues[myo_index].put(('led', logo, bar))
            if DEBUG_COMMANDS:
                print(f"Command queued: Myo {myo_index} LED Logo{tuple(logo)}, Bar{tuple(bar)}")
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
    server_thread = threading.Thread(target=server.serve_forever, daemon=True)
    server_thread.start()


def myo_worker(myo_index, mac_addr, dongle):
    """
    Worker thread for a single Myo armband.
    Each Myo connects via its assigned dongle.
    """
    try:
        # Create per-Myo command queue for OSC commands (vibrate, LED)
        command_queues[myo_index] = queue.Queue()

        if DEBUG_CONNECTION:
            print(f"Myo {myo_index}: Connecting via {dongle}...")
        else:
            print(f"Myo {myo_index}: Connecting...")

        # Create Myo instance and connect
        m = Myo(tty=dongle, mode=EMG_MODE)
        m.connect(mac_addr)

        print(f"Myo {myo_index}: Connected via {dongle}")

        # Vibrate once to confirm connection
        m.vibrate(1)

        # Store Myo instance
        myos.append((myo_index, m))

        # Create and register handlers
        emg_h, imu_h, battery_h, pose_h, arm_h = create_handlers(myo_index)
        m.add_emg_handler(emg_h)
        m.add_imu_handler(imu_h)
        m.add_battery_handler(battery_h)
        m.add_pose_handler(pose_h)
        m.add_arm_handler(arm_h)

        # Signal connection success to main thread
        print(f"Myo {myo_index}: Ready!\n")
        connection_events[myo_index].set()

        # Main data loop: process commands and read Myo data
        while not shutdown_event.is_set():
            # Check for incoming OSC commands (non-blocking)
            try:
                cmd_type, *cmd_args = command_queues[myo_index].get_nowait()
                if cmd_type == 'vibrate':
                    m.vibrate(cmd_args[0])
                    if DEBUG_COMMANDS:
                        print(f"Executed: Myo {myo_index} vibrate {cmd_args[0]}")
                elif cmd_type == 'led':
                    m.set_leds(cmd_args[0], cmd_args[1])
                    if DEBUG_COMMANDS:
                        print(f"Executed: Myo {myo_index} LED {cmd_args[0]}")
            except queue.Empty:
                pass
            except Exception as e:
                print(f"Command error Myo {myo_index}: {e}")

            # Read and process Myo data (triggers registered handlers)
            m.run()

    except Exception as e:
        # Suppress common disconnect/shutdown errors
        error_msg = str(e).lower()
        if "device reports readiness" not in error_msg and "keyboard" not in error_msg:
            print(f"Myo {myo_index} error: {e}")
        # Signal failure so main thread doesn't hang
        connection_events[myo_index].set()


# ==================== MAIN ====================

try:
    # ===== CONFIGURATION VALIDATION =====
    if not MYO_MAC_ADDRESSES:
        print("\nERROR: No MAC addresses configured")
        print("\nTo find your Myo MAC addresses:")
        print("  python scan.py")
        print("\nThen edit MYO_MAC_ADDRESSES in pyomyosc.py:")
        print("  MYO_MAC_ADDRESSES = [[255, 201, 227, 231, 151, 241], ...]")
        exit(1)

    # ===== HARDWARE DETECTION =====
    dongles = detect_dongles()
    print(f"\nDetected {len(dongles)} Bluetooth dongle(s):")
    for i, dongle in enumerate(dongles, 1):
        print(f"  Dongle {i}: {dongle}")

    # Check if we have enough dongles
    if len(dongles) < len(MYO_MAC_ADDRESSES):
        print(f"\nERROR: Need {len(MYO_MAC_ADDRESSES)} dongle(s) but only found {len(dongles)}")
        print("Each Myo requires its own Bluetooth dongle")
        exit(1)

    print(f"\nConnecting to {len(MYO_MAC_ADDRESSES)} Myo(s)...\n")

    # ===== INITIALIZATION =====
    if ENABLE_OSC_COMMANDS:
        start_osc_server()

    # Create threading events to track connection status
    for i in range(1, len(MYO_MAC_ADDRESSES) + 1):
        connection_events[i] = threading.Event()

    # ===== PARALLEL CONNECTION PHASE =====
    # Start all Myo workers in parallel
    for i, (mac_addr, dongle) in enumerate(zip(MYO_MAC_ADDRESSES, dongles), 1):
        thread = threading.Thread(target=myo_worker, args=(i, mac_addr, dongle), daemon=True)
        thread.start()

    # Wait for all connections to complete
    connection_timeout = 5  # seconds per Myo
    all_connected = True
    for i in range(1, len(MYO_MAC_ADDRESSES) + 1):
        if not connection_events[i].wait(timeout=connection_timeout):
            print(f"\nWARNING: Myo {i} connection timeout after {connection_timeout}s")
            all_connected = False

    # Check if we have any successful connections
    successful_myos = [idx for idx, m in myos]
    if not successful_myos:
        print("\nERROR: No Myos connected. Exiting...")
        exit(1)

    # ===== STREAMING PHASE =====
    print("\n" + "=" * 60)
    if all_connected:
        print("All Myos connected! Streaming OSC data...")
    else:
        print(f"{len(successful_myos)}/{len(MYO_MAC_ADDRESSES)} Myos connected. Streaming OSC data...")
    print("=" * 60)

    # Show connection summary
    for myo_idx, myo_obj in sorted(myos):
        tty = myo_obj.bt.ser.port
        print(f"  Myo {myo_idx} -> {tty}")

    print(f"\nOutgoing data (port {OSC_PORT}):")
    print("  /myo/N/emg, /myo/N/quat, /myo/N/accel, /myo/N/gyro")
    print("  /myo/N/battery, /myo/N/pose, /myo/N/arm")

    if ENABLE_OSC_COMMANDS:
        print(f"\nIncoming commands (port {OSC_COMMAND_PORT}):")
        print("  /myo/N/vibrate [1-3]")
        print("  /myo/N/led [r g b]")

    print("\n" + "=" * 60)
    print("Press Ctrl+C to stop")
    print("=" * 60 + "\n")

    # Keep main thread alive while workers stream data
    shutdown_event.wait()

except KeyboardInterrupt:
    print("\n\nStopping...")
    shutdown_event.set()  # Signal worker threads to stop
    time.sleep(0.2)  # Give threads time to exit their run() loops

    for myo_index, m in myos:
        try:
            m.vibrate(1)
            m.disconnect()
        except Exception as e:
            if DEBUG_CONNECTION:
                print(f"Myo {myo_index} disconnect: {e}")
    print("Disconnected.")

except Exception as e:
    print(f"\nError: {e}")
