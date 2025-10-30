"""
Myo to OSC Bridge - Complete Data Stream
Sends all Myo armband data to Max/MSP or other OSC software via UDP

Data streams:
- EMG: 8-channel muscle sensor data
- IMU: Quaternion orientation, accelerometer, gyroscope
- Battery: Battery level percentage
- Pose: Gesture detection (fist, wave, etc.)
- Arm: Which arm the Myo is on (left/right)

Default setup:
- Target: localhost (127.0.0.1)
- Data out port: 8000
- Commands in port: 8001 (optional)

OSC Addresses (outgoing data):
  * /myo/emg - 8 floats (EMG channels)
  * /myo/quat - 4 floats (orientation quaternion: w, x, y, z)
  * /myo/accel - 3 floats (accelerometer: x, y, z)
  * /myo/gyro - 3 floats (gyroscope: x, y, z)
  * /myo/battery - 1 int (battery percentage 0-100)
  * /myo/pose - 1 string (gesture name)
  * /myo/arm - 2 strings (arm: left/right, xdir: toward_wrist/toward_elbow)

OSC Commands (incoming, optional):
  * /myo/vibrate [1-3] - Trigger vibration (1=short, 2=medium, 3=long)
  * /myo/led [r g b] - Set LED color (RGB 0-255)

Usage:
    python myo_to_osc.py

In Max/MSP (receive data):
    [udpreceive 8000]
    |
    [route /myo/emg /myo/quat /myo/accel /myo/gyro /myo/battery /myo/pose /myo/arm]

In Max/MSP (send commands):
    [message 2(
    |
    [prepend /myo/vibrate]
    |
    [udpsend 127.0.0.1 8001]
"""

from pyomyo import Myo, emg_mode
from pythonosc import udp_client
from pythonosc.dispatcher import Dispatcher
from pythonosc.osc_server import BlockingOSCUDPServer
import threading
import queue

# ==================== CONFIGURATION ====================

# OSC Configuration
OSC_IP = "127.0.0.1"      # Target IP (localhost or remote machine)
OSC_PORT = 8000           # Target port for outgoing data (must match receiver)

# OSC Commands (incoming from Max)
ENABLE_OSC_COMMANDS = True   # Set to False to disable command receiver
OSC_COMMAND_PORT = 8001      # Port for incoming commands from Max

# EMG Mode Selection (choose one)
# EMG_MODE = emg_mode.PREPROCESSED  # 0-1024, 50Hz (envelope-like)
EMG_MODE = emg_mode.FILTERED    # -128 to 127, 200Hz (clean audio)
# EMG_MODE = emg_mode.RAW         # -128 to 127, 200Hz (noisy audio)

# Enable/Disable Data Streams
SEND_EMG = True           # 8-channel EMG data
SEND_IMU = True           # Quaternion, accelerometer, gyroscope
SEND_BATTERY = True       # Battery level
SEND_POSE = True          # Gesture detection
SEND_ARM = True           # Arm detection (left/right)

# Debug Output (set to True to see data in terminal)
DEBUG_EMG = False
DEBUG_IMU = False
DEBUG_BATTERY = False
DEBUG_POSE = False
DEBUG_ARM = False
DEBUG_COMMANDS = False    # Show incoming OSC commands

# =======================================================

print("=" * 60)
print("Myo to OSC Bridge - Complete Data Stream")
print("=" * 60)
print(f"Sending OSC to: {OSC_IP}:{OSC_PORT}")
print(f"EMG Mode: {EMG_MODE.name}")
print(f"\nEnabled streams:")
if SEND_EMG:
    print("  ✓ EMG (8 channels)")
if SEND_IMU:
    print("  ✓ IMU (quaternion, accel, gyro)")
if SEND_BATTERY:
    print("  ✓ Battery level")
if SEND_POSE:
    print("  ✓ Pose/gesture detection")
if SEND_ARM:
    print("  ✓ Arm detection")
print("=" * 60)
print("\nPress Ctrl+C to stop\n")

# Initialize OSC client
osc_client = udp_client.SimpleUDPClient(OSC_IP, OSC_PORT)

# Initialize Myo
m = Myo(mode=EMG_MODE)
m.connect()


# ==================== CALLBACK HANDLERS ====================

def send_emg_to_osc(emg, movement):
    """
    Send EMG data via OSC

    Args:
        emg: tuple of 8 EMG values (one per sensor)
        movement: movement data (not used)
    """
    if SEND_EMG:
        osc_client.send_message("/myo/emg", list(emg))

        if DEBUG_EMG:
            print(f"EMG: {emg}")


def send_imu_to_osc(quat, accel, gyro):
    """
    Send IMU data via OSC

    Args:
        quat: quaternion (w, x, y, z) - orientation
        accel: accelerometer (x, y, z) - m/s²
        gyro: gyroscope (x, y, z) - rad/s
    """
    if SEND_IMU:
        # Send each IMU component separately
        osc_client.send_message("/myo/quat", list(quat))
        osc_client.send_message("/myo/accel", list(accel))
        osc_client.send_message("/myo/gyro", list(gyro))

        if DEBUG_IMU:
            print(f"Quat: {quat}")
            print(f"Accel: {accel}")
            print(f"Gyro: {gyro}")


def send_battery_to_osc(battery_level):
    """
    Send battery level via OSC

    Args:
        battery_level: int (0-100)
    """
    if SEND_BATTERY:
        osc_client.send_message("/myo/battery", battery_level)

        if DEBUG_BATTERY:
            print(f"Battery level: {battery_level}%")


def send_pose_to_osc(pose):
    """
    Send pose/gesture detection via OSC

    Args:
        pose: Pose enum (REST, FIST, WAVE_IN, WAVE_OUT, FINGERS_SPREAD, THUMB_TO_PINKY)
    """
    if SEND_POSE:
        pose_name = pose.name.lower()  # Convert to lowercase string
        osc_client.send_message("/myo/pose", pose_name)

        if DEBUG_POSE:
            print(f"Pose detected: {pose_name}")


def send_arm_to_osc(arm, xdir):
    """
    Send arm detection via OSC

    Args:
        arm: Arm enum (LEFT, RIGHT, UNKNOWN)
        xdir: XDirection enum (TOWARD_WRIST, TOWARD_ELBOW, UNKNOWN)
    """
    if SEND_ARM:
        arm_name = arm.name.lower()
        xdir_name = xdir.name.lower()
        osc_client.send_message("/myo/arm", [arm_name, xdir_name])

        if DEBUG_ARM:
            print(f"Arm: {arm_name}, X-direction: {xdir_name}")


# ==================== OSC COMMAND HANDLERS ====================

# Command queue (thread-safe communication between OSC thread and main thread)
command_queue = queue.Queue()

def handle_vibrate(unused_addr, *args):
    """
    Handle incoming /myo/vibrate command from Max
    Puts command in queue to be processed by main thread

    Args:
        intensity: Vibration intensity (1=short, 2=medium, 3=long)
    """
    try:
        if len(args) < 1:
            print("Vibrate: missing intensity argument (send /myo/vibrate [1-3])")
            return

        intensity = int(args[0])
        if 1 <= intensity <= 3:
            command_queue.put(('vibrate', intensity))
            if DEBUG_COMMANDS:
                print(f"Command queued: vibrate {intensity}")
        else:
            print(f"Vibrate: invalid intensity {intensity} (must be 1-3)")
    except Exception as e:
        print(f"Vibrate error: {e}")


def handle_led(unused_addr, *args):
    """
    Handle incoming /myo/led command from Max
    Puts command in queue to be processed by main thread

    Args:
        r, g, b: RGB values (0-255) for both logo and bar LEDs
        or
        r1, g1, b1, r2, g2, b2: Separate RGB for logo and bar
    """
    try:
        if len(args) == 3:
            # Same color for both LEDs
            r, g, b = [int(v) for v in args]
            command_queue.put(('led', [r, g, b], [r, g, b]))
            if DEBUG_COMMANDS:
                print(f"Command queued: LED RGB({r}, {g}, {b})")
        elif len(args) == 6:
            # Separate colors for logo and bar
            r1, g1, b1, r2, g2, b2 = [int(v) for v in args]
            command_queue.put(('led', [r1, g1, b1], [r2, g2, b2]))
            if DEBUG_COMMANDS:
                print(f"Command queued: LED Logo RGB({r1}, {g1}, {b1}), Bar RGB({r2}, {g2}, {b2})")
        else:
            print(f"LED: invalid args (need 3 or 6 values, got {len(args)})")
    except Exception as e:
        print(f"LED error: {e}")


def start_osc_server():
    """Start OSC server in background thread to receive commands from Max"""
    dispatcher = Dispatcher()
    dispatcher.map("/myo/vibrate", handle_vibrate)
    dispatcher.map("/myo/led", handle_led)

    server = BlockingOSCUDPServer(("0.0.0.0", OSC_COMMAND_PORT), dispatcher)
    print(f"OSC command receiver listening on port {OSC_COMMAND_PORT}")
    print("  Send /myo/vibrate [1-3] to trigger vibration")
    print("  Send /myo/led [r g b] to set LED color\n")

    # Run server in background thread
    server_thread = threading.Thread(target=server.serve_forever, daemon=True)
    server_thread.start()
    return server


# ==================== SETUP ====================

# Start OSC command server if enabled
osc_server = None
if ENABLE_OSC_COMMANDS:
    osc_server = start_osc_server()

# Vibrate to confirm connection (LED stays at Myo default)
m.vibrate(1)

# Register all enabled handlers
if SEND_EMG:
    m.add_emg_handler(send_emg_to_osc)

if SEND_IMU:
    m.add_imu_handler(send_imu_to_osc)

if SEND_BATTERY:
    m.add_battery_handler(send_battery_to_osc)

if SEND_POSE:
    m.add_pose_handler(send_pose_to_osc)

if SEND_ARM:
    m.add_arm_handler(send_arm_to_osc)

print("Connected to Myo! Streaming data via OSC...")
print("Flex your muscles and move the Myo to test signals\n")

# ==================== MAIN LOOP ====================

try:
    while True:
        # Process any queued OSC commands (thread-safe)
        while not command_queue.empty():
            try:
                cmd = command_queue.get_nowait()
                if cmd[0] == 'vibrate':
                    intensity = cmd[1]
                    m.vibrate(intensity)
                    if DEBUG_COMMANDS:
                        print(f"Executed: vibrate {intensity}")
                elif cmd[0] == 'led':
                    logo_color = cmd[1]
                    bar_color = cmd[2]
                    m.set_leds(logo_color, bar_color)
                    if DEBUG_COMMANDS:
                        print(f"Executed: LED {logo_color}")
            except queue.Empty:
                break
            except Exception as e:
                print(f"Command execution error: {e}")

        # Run Myo data loop
        m.run()
except KeyboardInterrupt:
    print("\n\nStopping OSC bridge...")
finally:
    # Vibrate to confirm shutdown (LED stays unchanged)
    try:
        m.vibrate(1)
    except:
        pass  # Ignore errors if already disconnected

    # Clean shutdown
    m.disconnect()
    print("Disconnected.")
