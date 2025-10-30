# pyomyosc

Python OSC bridge for Myo armband. Stream EMG, IMU, and gesture data to Max/MSP, TouchDesigner, or any OSC-compatible software. Supports bidirectional control.

## Requirements

- Python 3.7+
- Myo armband with USB Bluetooth dongle
- Max/MSP, TouchDesigner, or any OSC software (optional)

## Installation

```bash
git clone https://github.com/francesco-di-maggio/pyomyosc.git
cd pyomyosc
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip3 install -r requirements.txt
```

**Note:** Virtual environment is required on modern macOS/Homebrew Python. This keeps dependencies isolated and prevents system conflicts.

## Quick Start

### Hardware Setup
1. Plug in Myo USB Bluetooth dongle
2. Power on Myo (hold button until vibrate)
3. macOS: Grant Bluetooth permissions when prompted

### Single Myo

Just run the script:
```bash
python3 pyomyosc.py
```

The Myo will vibrate once and start streaming on `/myo/1/*` addresses.

### Multiple Myos

Edit `pyomyosc.py` and add MAC addresses:
```python
MYO_MAC_ADDRESSES = [
    [255, 201, 227, 231, 151, 241],  # Myo 1 (left arm)
    [147, 123, 98, 76, 54, 32],       # Myo 2 (right arm)
]
```

Run the script:
```bash
python3 pyomyosc.py
```

Each Myo vibrates to identify itself (1 vibration = Myo 1, 2 vibrations = Myo 2, etc.).

## OSC Messages

### Outgoing Data (Port 8000)

Python sends Myo sensor data to your application:

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

Edit top of `pyomyosc.py` or `pyomyosc_multi.py`:

```python
# OSC Configuration
OSC_IP = "127.0.0.1"              # Target IP
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

# Debug Output
DEBUG_EMG = False
DEBUG_IMU = False
DEBUG_COMMANDS = False
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

- **pyomyosc.py** - Main script (handles single or multiple Myos)
- **poweroff.py** - Power off utility (deep sleep)

## Workflow

**Setup once:**
```bash
git clone https://github.com/francesco-di-maggio/pyomyosc.git
cd pyomyosc
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

**Every session:**
```bash
cd pyomyosc
source venv/bin/activate
python3 pyomyosc.py
```

**In Max/MSP:**
- Receive on port 8000
- Send commands to port 8001 (if enabled)

**When done:**
- Press Ctrl+C
- Myo vibrates and disconnects (goes to sleep)

**Deep sleep (optional):**
```bash
python3 poweroff.py  # Requires USB to wake
```

## Troubleshooting

### "Module not found" or "externally-managed-environment"

Make sure virtual environment is activated:
```bash
cd pyomyosc
source venv/bin/activate
pip3 install -r requirements.txt
```

If you see `(venv)` in your prompt, the environment is active.

### No data in Max/MSP
1. Check Python shows "Connected to Myo"
2. Verify Max: `[udpreceive 8000]`
3. Check Max console (Cmd+B)
4. Try: `OSC_IP = "127.0.0.1"` in script

### Myo won't connect
1. Power on Myo (hold button until vibrate)
2. Check USB dongle plugged in
3. macOS: Grant Bluetooth permissions
4. Try unplug/replug dongle
5. Check battery level

### Connection drops
1. Myo battery ~3 hours - check level
2. Perform gesture to wake from sleep
3. Keep within 10m of dongle

### Multiple Myos not found
1. Power on all Myos before running
2. Run scan first (without MAC addresses)
3. Verify MAC addresses typed correctly
4. Each Myo needs 2-3 seconds to connect

### "Address already in use"
```bash
lsof -i :8000  # Check port usage
```
Change port in script or close other program

## Platform Notes

**macOS:** Grant Bluetooth permissions in System Preferences > Security & Privacy

**Linux:** Add user to dialout group:
```bash
sudo usermod -a -G dialout $USER
# Log out and log back in
```

**Windows:** Use `venv\Scripts\activate` instead of `source venv/bin/activate`

## License

MIT License - see [LICENSE](LICENSE)

## Credits

Built on [pyomyo](https://github.com/PerlinWarp/pyomyo) library by PerlinWarp
