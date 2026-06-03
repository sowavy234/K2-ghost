# Creality Knomi Hi Setup Guide

## Overview
This guide explains how to integrate Creality Knomi Hi display support with your K2 SE running K2-Ghost v1.0.0.

## Prerequisites
- Creality Knomi Hi display connected to your K2 SE
- Klipper properly configured on your printer
- K2-Ghost v1.0.0 or later installed

## Installation

### Option 1: Automatic Installation (Recommended)
The Knomi Hi configuration is included by default in K2-Ghost v1.0.0. The `knomi_hi.cfg` is automatically included in your `printer.cfg`.

Simply run the installer:
```bash
sh install_all_k2se.sh
```

### Option 2: Manual Installation

1. **Copy the Knomi Hi configuration file:**
   ```bash
   cp config/knomi_hi.cfg ~/printer_data/config/knomi_hi.cfg
   ```

2. **Add the include line to your `printer.cfg`:**
   Open `~/printer_data/config/printer.cfg` and add:
   ```ini
   [include knomi_hi.cfg]
   ```

3. **Restart Klipper:**
   ```bash
   sudo systemctl restart klipper
   ```

## Available Macros

### KNOMI_PRINT_START
Initializes the Knomi Hi display for printing.
```gcode
KNOMI_PRINT_START BED_TEMP=60 EXTRUDER_TEMP=200
```

### KNOMI_PRINT_END
Displays completion message when print finishes.
```gcode
KNOMI_PRINT_END
```

### KNOMI_PAUSE
Pauses print and updates display.
```gcode
KNOMI_PAUSE
```

### KNOMI_RESUME
Resumes print and updates display.
```gcode
KNOMI_RESUME
```

### KNOMI_ERROR
Display custom error message.
```gcode
KNOMI_ERROR MSG="Thermal Runaway"
```

### UPDATE_KNOMI_STATUS
Updates display with real-time printer status (progress, temperatures).
```gcode
UPDATE_KNOMI_STATUS
```

## Integration with Print Macros

To fully integrate Knomi Hi with your print start/end sequences, update your `macros.cfg`:

```gcode
[gcode_macro PRINT_START]
gcode:
    # ... your existing code ...
    KNOMI_PRINT_START BED_TEMP={BED_TEMP} EXTRUDER_TEMP={EXTRUDER_TEMP}
    # ... rest of start macro ...

[gcode_macro PRINT_END]
gcode:
    # ... your existing code ...
    KNOMI_PRINT_END
    # ... rest of end macro ...
```

## Display Themes
The Knomi Hi supports multiple display themes. Configure your preferred theme in the Knomi Hi web interface or mobile app.

## Troubleshooting

### Display Not Updating
- Ensure `knomi_hi.cfg` is included in `printer.cfg`
- Verify Klipper is running: `systemctl status klipper`
- Check logs: `tail -f ~/printer_data/logs/klippy.log | grep -i knomi`

### Macros Not Working
- Restart Klipper: `sudo systemctl restart klipper`
- Verify macro syntax in `knomi_hi.cfg`
- Check for conflicting macro definitions

### Connection Issues
- Restart Knomi Hi device
- Check USB/serial connection
- Verify baud rate settings in Klipper config

## Support
For issues or questions, open an issue on the K2-Ghost GitHub repository.
