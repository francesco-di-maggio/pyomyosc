"""
pyomyosc - Unified Myo OSC Bridge
Connects to one or more Myo armbands and streams data via OSC

Setup:
    1. Run: python3 scan.py (to find MAC addresses in decimal format)
    2. Edit MYO_MAC_ADDRESSES in this file
    3. Run: python3 pyomyosc.py

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
# Run: python3 scan.py to find your MAC addresses
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
myos_lock = threading.Lock()  # Lock for thread-safe access to myos list


def detect_dongles():
    """Detect all available Myo dongles by USB vendor/product ID"""
    dongles = []
    for p in comports():
        if re.search(r'PID=2458:0*1', p[2]):  # Thalmic Labs Myo dongle
            dongles.append(p[0])
    return dongles


def connect_with_timeout(myo, mac_addr, timeout=6):
    """
    Attempt to connect to Myo with a timeout.
    Returns (success, error_message)
    """
    result = {'success': False, 'error': None}

    def connect_thread():
        try:
            myo.connect(mac_addr)
            result['success'] = True
        except Exception as e:
            result['error'] = str(e)

    thread = threading.Thread(target=connect_thread, daemon=True)
    thread.start()
    thread.join(timeout=timeout)

    if thread.is_alive():
        return (False, f"Timeout after {timeout}s")

    if result['success']:
        return (True, None)
    else:
        return (False, result['error'] or "Unknown error")


def find_working_dongle(mac_addr, dongles, emg_mode):
    """
    Try each dongle until we find one that connects to this Myo.
    Returns (Myo object, tty) or (None, None) if all fail.
    """
    for tty in dongles:
        if DEBUG_CONNECTION:
            print(f"  Trying dongle {tty}...")

        try:
            m = Myo(tty=tty, mode=emg_mode)
            time.sleep(1)  # Give dongle time to initialize

            success, error = connect_with_timeout(m, mac_addr, timeout=6)

            if success:
                if DEBUG_CONNECTION:
                    print(f"  SUCCESS with {tty}!")
                return (m, tty)
            else:
                if DEBUG_CONNECTION:
                    print(f"  Failed: {error}")
        except Exception as e:
            if DEBUG_CONNECTION:
                print(f"  Error with {tty}: {e}")

    return (None, None)


def clamp_rgb(value):
    """Clamp RGB value to valid range 0-255"""
    return max(0, min(255, int(value)))


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
            print(f"Vibrate: missing intensity argument (send /myo/N/vibrate [1-3])")
            return

        # Extract myo index from address: /myo/1/vibrate -> 1
        myo_index = int(address.split('/')[2])
        intensity = int(args[0])

        if 1 <= intensity <= 3:
            if myo_index in command_queues:
                command_queues[myo_index].put(('vibrate', intensity))
                if DEBUG_COMMANDS:
                    print(f"Command queued: Myo {myo_index} vibrate {intensity}")
            else:
                print(f"Vibrate: Myo {myo_index} not connected")
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

        if myo_index not in command_queues:
            print(f"LED: Myo {myo_index} not connected")
            return

        if len(args) == 3:
            # Same color for both logo and bar LEDs
            r, g, b = [clamp_rgb(v) for v in args]
            command_queues[myo_index].put(('led', [r, g, b], [r, g, b]))
            if DEBUG_COMMANDS:
                print(f"Command queued: Myo {myo_index} LED RGB({r}, {g}, {b})")
        elif len(args) == 6:
            # Separate colors for logo and bar LEDs
            r1, g1, b1, r2, g2, b2 = [clamp_rgb(v) for v in args]
            command_queues[myo_index].put(('led', [r1, g1, b1], [r2, g2, b2]))
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
    server_thread = threading.Thread(target=server.serve_forever, daemon=True)
    server_thread.start()


def myo_worker(myo_index, mac_addr, available_dongles):
    """
    Worker thread for a single Myo armband.
    Auto-detects which dongle works with this Myo.
    """
    try:
        # Create per-Myo command queue for OSC commands (vibrate, LED)
        command_queues[myo_index] = queue.Queue()

        if DEBUG_CONNECTION:
            print(f"Myo {myo_index}: Trying {len(available_dongles)} dongle(s)...")
        else:
            print(f"Myo {myo_index}: Connecting...")

        m, tty = find_working_dongle(mac_addr, available_dongles, EMG_MODE)

        if m is None:
            print(f"Myo {myo_index}: Failed - no compatible dongle found")
            connection_events[myo_index].set()
            return

        print(f"Myo {myo_index}: Connected via {tty}")

        # Vibrate once to confirm connection
        m.vibrate(1)
        time.sleep(0.5)

        # Store Myo instance with thread safety
        with myos_lock:
            myos.append((myo_index, m))

        # Create and register handlers
        handlers = create_handlers(myo_index)
        m.add_emg_handler(handlers[0])
        m.add_imu_handler(handlers[1])
        m.add_battery_handler(handlers[2])
        m.add_pose_handler(handlers[3])
        m.add_arm_handler(handlers[4])

        # Signal connection success to main thread
        print(f"Myo {myo_index}: Ready!\n")
        connection_events[myo_index].set()

        # Main data loop: process commands and read Myo data
        while True:
            # Check for incoming OSC commands (non-blocking)
            try:
                cmd = command_queues[myo_index].get_nowait()
                if cmd[0] == 'vibrate':
                    m.vibrate(cmd[1])
                    if DEBUG_COMMANDS:
                        print(f"Executed: Myo {myo_index} vibrate {cmd[1]}")
                elif cmd[0] == 'led':
                    m.set_leds(cmd[1], cmd[2])  # logo_color, bar_color
                    if DEBUG_COMMANDS:
                        print(f"Executed: Myo {myo_index} LED {cmd[1]}")
            except queue.Empty:
                pass  # No commands queued
            except Exception as e:
                print(f"Command execution error for Myo {myo_index}: {e}")

            # Read and process Myo data (triggers registered handlers)
            m.run()

    except Exception as e:
        # Ignore "device reports readiness" errors during Ctrl+C shutdown
        if "device reports readiness" not in str(e):
            print(f"Myo {myo_index} error: {e}")


# ==================== MAIN ====================

try:
    # ===== CONFIGURATION VALIDATION =====
    if not MYO_MAC_ADDRESSES:
        print("\nERROR: No MAC addresses configured")
        print("\nTo find your Myo MAC addresses:")
        print("  python3 scan.py")
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

    # Show connection info
    if len(MYO_MAC_ADDRESSES) > 1:
        print("Each Myo will auto-detect its compatible dongle.\n")
    else:
        print()

    # ===== INITIALIZATION =====
    # Start OSC command server (runs in background thread)
    if ENABLE_OSC_COMMANDS:
        start_osc_server()

    # Create threading events to track connection status
    for i in range(1, len(MYO_MAC_ADDRESSES) + 1):
        connection_events[i] = threading.Event()

    # ===== CONNECTION PHASE =====
    # Start Myos sequentially - each finds its own compatible dongle
    available_dongles = dongles.copy()

    for i, mac_addr in enumerate(MYO_MAC_ADDRESSES, 1):
        # Pass copy of available dongles to avoid race conditions
        thread = threading.Thread(target=myo_worker, args=(i, mac_addr, available_dongles.copy()), daemon=True)
        thread.start()

        # Wait for connection (or failure) before starting next Myo
        # Timeout: 4s per available dongle
        timeout = len(available_dongles) * 4
        if not connection_events[i].wait(timeout=max(timeout, 4)):
            print(f"\nERROR: Myo {i} connection timeout. Exiting...")
            exit(1)

        # Remove the dongle that was successfully used
        with myos_lock:
            for myo_idx, myo_obj in myos:
                if myo_idx == i:
                    used_tty = myo_obj.bt.ser.port
                    if used_tty in available_dongles:
                        available_dongles.remove(used_tty)
                    break

    # ===== STREAMING PHASE =====
    print("\n" + "=" * 60)
    print("All Myos connected! Streaming OSC data...")
    print("=" * 60)

    # Show connection summary
    with myos_lock:
        for myo_idx, myo_obj in sorted(myos):
            tty = myo_obj.bt.ser.port
            print(f"  Myo {myo_idx} -> {tty}")

    # Show outgoing data streams
    print(f"\nOutgoing data (port {OSC_PORT}):")
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
        print(f"\nIncoming commands (port {OSC_COMMAND_PORT}):")
        if len(MYO_MAC_ADDRESSES) == 1:
            print("  /myo/1/vibrate [1-3]  - Trigger vibration")
            print("  /myo/1/led [r g b]    - Set LED color")
        else:
            print("  /myo/N/vibrate [1-3]  - Trigger vibration")
            print("  /myo/N/led [r g b]    - Set LED color")

    print("\n" + "=" * 60)
    print("Press Ctrl+C to stop")
    print("=" * 60 + "\n")

    # Keep main thread alive while workers stream data
    while True:
        time.sleep(1)

except KeyboardInterrupt:
    # ===== SHUTDOWN =====
    print("\n\nStopping...")

    # Attempt graceful disconnect (second Ctrl+C forces immediate quit)
    try:
        with myos_lock:
            for myo_index, m in myos:
                try:
                    m.disconnect()
                except Exception:
                    pass  # Ignore disconnect errors
        print("Disconnected.")
    except KeyboardInterrupt:
        print("Force quit.")

except Exception as e:
    print(f"\nError: {e}")
