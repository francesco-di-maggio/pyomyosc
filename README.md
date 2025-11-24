# pyomyosc

Python OSC bridge for Myo armband(s). Stream EMG, IMU, and gesture data to Max/MSP, Pure Data, or any OSC-compatible software.

## Requirements

- Python 3.7+
- Myo armband(s) with USB Bluetooth dongle(s)
- **Important:** Each Myo requires its own dedicated USB Bluetooth dongle
- Max/MSP, Pure Data, or any OSC software (optional)
- No need for Myo Connect!

## Installation

**Install with virtual environment (venv):**

```bash
git clone https://github.com/francesco-di-maggio/pyomyosc.git
cd pyomyosc
python -m venv .venv
# Use python3 instead of python if needed (older macOS/Linux systems)
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

**Note:** Virtual environment is recommended as it keeps dependencies isolated and prevents system conflicts.

**Quick install (without venv):**
```bash
pip install --user -r requirements.txt
# or: pip3 install --user -r requirements.txt
```

## Quick Start

### Hardware Setup
1. Plug in Myo USB Bluetooth dongle(s)
2. Connect Myo to USB power to turn it on
3. Keep Myo awake by wearing it or moving it

### Find Your Myo MAC Addresses

First, run the scanner to find your Myo MAC addresses:
```bash
source .venv/bin/activate  # If using venv
python scan.py
```

The scan will show MAC addresses in decimal format. Copy the output.

### Configure MAC Addresses

Edit `pyomyosc.py` and add your MAC addresses:

**Single Myo:**
```python
MYO_MAC_ADDRESSES = [
    [255, 201, 227, 231, 151, 241],  # Your Myo
]
```

**Multiple Myos:**
```python
MYO_MAC_ADDRESSES = [
    [255, 201, 227, 231, 151, 241],  # Myo 1 (e.g. left arm)
    [147, 123, 98, 76, 54, 32],      # Myo 2 (e.g. right arm)
]
```

**Important:** Each Myo needs its own USB dongle. The code will detect dongles automatically.

### Run

```bash
source .venv/bin/activate  # If using venv. On Windows: .venv\Scripts\activate
python pyomyosc.py
```

Each Myo vibrates once when successfully connected.

**Note:** Remember to activate the virtual environment (`source .venv/bin/activate`) in every new terminal window. Your prompt will show `(.venv)` when activated.

**When done:**
- Press Ctrl+C to stop - Myo vibrates and disconnects
- For deep sleep: `python shutdown.py` (requires USB charging to wake)

## OSC Messages

### Outgoing Data (Port 8000)

Python sends Myo sensor data to your application via OSC:

| Address | Type | Description | Rate |
|---------|------|-------------|------|
| `/myo/emg` | 8 floats | EMG channels | 50Hz or 200Hz |
| `/myo/quat` | 4 floats | Quaternion (w,x,y,z) | 50Hz |
| `/myo/accel` | 3 floats | Accelerometer (x,y,z) in g | 50Hz |
| `/myo/gyro` | 3 floats | Gyroscope (x,y,z) in deg/s | 50Hz |
| `/myo/battery` | 1 int | Battery % (0-100) | On change |
| `/myo/pose` | 1 string | Gesture name | On change |
| `/myo/arm` | 2 strings | Arm, direction | On connect |

**Multiple Myos:** `/myo/1/emg`, `/myo/2/emg`, etc.

### Incoming Commands (Port 8001, Optional)

Send commands from your application to control Myo:

| Address | Args | Description |
|---------|------|-------------|
| `/myo/vibrate` | int (1-3) | Vibration: 1=short, 2=medium, 3=long |
| `/myo/led` | 3 ints (0-255) | LED color: RGB values |

**Multiple Myos:** `/myo/1/vibrate`, `/myo/2/led`, etc.

**Enable in script:** `ENABLE_OSC_COMMANDS = True`

## Configuration

Edit `pyomyosc.py`:

```python
# OSC Configuration
OSC_IP = "127.0.0.1"               # Target IP
OSC_PORT = 8000                    # Outgoing data port
OSC_COMMAND_PORT = 8001            # Incoming commands port
ENABLE_OSC_COMMANDS = True         # Enable bidirectional control

# EMG Mode
EMG_MODE = emg_mode.FILTERED       # PREPROCESSED, FILTERED, or RAW

# Enable/Disable Streams
SEND_EMG = True
SEND_IMU = True
SEND_BATTERY = True
SEND_POSE = True
SEND_ARM = True

# Debug Output on Terminal
DEBUG_CONNECTION = False   # Connection and battery info
DEBUG_COMMANDS = False     # OSC command logging
```

## Data Ranges

### EMG Modes

| Mode | Range | Rate | Use Case |
|------|-------|------|----------|
| `PREPROCESSED` | 0 to 1024 | 50Hz | Envelope detection |
| `FILTERED` | -128 to 127 | 200Hz | Audio synthesis, real-time control |
| `RAW` | -128 to 127 | 200Hz | Signal processing, ML training |

### IMU Scaling

**Quaternion:** `int16 / 16384` → normalized (-1 to 1)
**Accelerometer:** `int16 / 2048` → g (±16g range)
**Gyroscope:** `int16 / 16` → deg/s (±2000 deg/s range)

For normalized range (-1 to 1): divide accel by 2000, gyro by 1000

### Gestures

`rest`, `fist`, `wave_in`, `wave_out`, `fingers_spread`, `double_tap`, `unknown`

## Max/MSP Integration

### Receive Data
```
[udpreceive 8000]
|
[route /myo/emg /myo/quat /myo/accel /myo/gyro /myo/pose]
```

### Send Commands
```
[message 2]
|
[prepend /myo/vibrate]
|
[udpsend 127.0.0.1 8001]
```

### Example Patch
- **[pyomyosc.maxpat](pyomyosc.maxpat)** - Complete example with data visualization and command sending

## Files

- **pyomyosc.py** - Main OSC bridge script
- **shutdown.py** - Shutdown utility (deep sleep)
- **scan.py** - MAC address scanner utility
- **pyomyosc.maxpat** - Max/MSP example patch

## Troubleshooting

### "Module not found" or "externally-managed-environment"

**With virtual environment (recommended):**
```bash
source .venv/bin/activate
pip install -r requirements.txt
```

**Without virtual environment:**
```bash
pip install --user -r requirements.txt
# or: pip3 install --user -r requirements.txt
```

If you see `(.venv)` in your prompt, the environment is active.

### No data in Max/MSP
1. Check Python shows "Connected to Myo"
2. Verify Max: `[udpreceive 8000]`
3. Check Max console (Cmd+M)

### Myo won't connect
1. Connect Myo to USB power to turn it on
2. Check USB dongle(s) plugged in (one per Myo)
3. macOS: Grant Bluetooth permissions if prompted
4. Try unplug/replug dongle
5. Check battery level
6. Run `python scan.py` to verify Myo is detectable

### Connection drops
1. Myo battery ~3 hours - check level
2. Perform "wave-out" gesture to wake from sleep
3. Keep within 10m of dongle

### Multiple Myos not found
1. Connect all Myos to USB power before running
2. Run `python scan.py` first to find MAC addresses
3. Verify MAC addresses typed correctly in pyomyosc.py
4. Ensure you have one USB dongle per Myo

## Credits

Built on [pyomyo](https://github.com/PerlinWarp/pyomyo) library by PerlinWarp

## License

See [LICENSE](LICENSE)