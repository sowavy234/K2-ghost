# K2 SE Automagic Enhancement Suite v1.0.0
# **Official Release**

**One command. All features. Zero headache.**

- ✅ Fully automated, one-run installer for your K2 SE
- ✅ No prompts, no questions, **just works!**
- ✅ Klipper unlock, DXC-adaptive mesh, flat bed macros
- ✅ Enhanced Gumphy screen install with new themes & modules
- ✅ Adaptive fan control (never messes up screen/backlight)
- ✅ **NEW:** Creality Knomi Hi display support
- ✅ **NEW:** Advanced terminal with real-time status
- ✅ **NEW:** Expanded macro library for complete control
- ✅ Custom Fluidd fork and on-printer UI

---

## 📋 What's New in v1.0.0

### 🎨 Enhanced Gumphy Screen
- **Multiple Themes:** Light, Dark, and Neon color schemes
- **New Informational Tabs:**
  - Printer Status (real-time monitoring)
  - Temperature Control & Display
  - Enhanced Terminal with command input
  - Macro quick-access buttons
- **Improved Modules:**
  - Better responsive UI
  - Touch-optimized interface
  - Live temperature graphs
  - Print progress tracking

### 🖥️ Creality Knomi Hi Support
- Full display integration for real-time print monitoring
- Custom macro support for status updates
- Display themes and customization options
- See `docs/KNOMI_HI_SETUP.md` for complete setup instructions

### 🛠️ Expanded Macro Library
- **Print Control:** Start, End, Pause, Resume, Cancel
- **Bed Leveling:** Adaptive mesh, manual leveling, area-specific calibration
- **DXC Extruder:** Dual extruder support with temperature adaptation
- **Fan Control:** Adaptive and manual speed adjustment
- **Terminal Commands:** Send custom gcode, get printer status
- **Knomi Hi Integration:** Display messages, temperature, progress updates
- **Utilities:** Load/unload filament, park toolhead, emergency stop

### 🖨️ Better Terminal
- Real-time gcode command input
- Color-coded output (info, warning, error)
- Live printer status display
- Command history support

---

## 🚀 Quick Start

SSH into your K2 SE and run:

```bash
git clone https://github.com/sowavy234/K2-ghost.git
cd K2-ghost
sh install_all_k2se.sh
```

---

## 📁 Directory Structure

```
K2-ghost/
├── config/
│   ├── printer.cfg           # Main configuration (now with Knomi Hi)
│   ├── macros.cfg            # Enhanced macro library
│   └── knomi_hi.cfg          # Creality Knomi Hi display config
├── ui/
│   └── gumphy-styles.css     # Enhanced Gumphy screen CSS with themes
├── docs/
│   ├── KNOMI_HI_SETUP.md     # Complete Knomi Hi setup guide
│   ├── Fluidd-Custom.md      # Custom Fluidd UI documentation
│   └── Gumpoy-K2SE.md        # Gumpoy screen documentation
├── install_all_k2se.sh       # One-command installer
└── README.md                 # This file
```

---

## ✨ Features

### Automation
- **Automated Bed Leveling & Flatness:** Insta-mesh with error-proof bed macro
- **One-command installer:** No manual configuration needed

### Printing
- **DXC Extruder adaptive macros** for dual extruder support
- **Adaptive cooling fan** (never messes up screen/backlight)
- **Print start/end macros** with Knomi Hi integration

### User Interface
- **Custom Fluidd UI:** YOUR branding, better sidebar, no outside names
- **Enhanced Gumpoy touchscreen:** Multiple themes, new modules
- **Creality Knomi Hi support:** Real-time display updates
- **Better terminal:** Command input, color-coded output

### Control
- **Advanced macro library** with 20+ ready-to-use commands
- **Terminal access** for custom gcode commands
- **Emergency controls** for safety

---

## 🎯 Installation Options

### Option 1: Automatic (Recommended)
```bash
sh install_all_k2se.sh
```

### Option 2: Manual Setup
See individual documentation files in `docs/` directory.

---

## 📚 Documentation

- **Setup Guide:** See `docs/KNOMI_HI_SETUP.md` for Creality Knomi Hi integration
- **Macros:** All available macros are documented in `config/macros.cfg`
- **UI:** Gumpoy screen documentation in `docs/Gumpoy-K2SE.md`
- **Fluidd:** Custom UI documentation in `docs/Fluidd-Custom.md`

---

## 🆘 Troubleshooting

### Installation Issues
- Ensure SSH access to K2 SE is working
- Verify git is installed on your printer
- Check internet connectivity

### Knomi Hi Not Working
- See `docs/KNOMI_HI_SETUP.md` for troubleshooting steps
- Verify USB connection
- Check Klipper logs

### Macros Not Running
- Restart Klipper: `sudo systemctl restart klipper`
- Verify macro syntax in config files
- Check `klippy.log` for errors

---

## 📞 Support

For issues, questions, or feature requests, please open an issue on the GitHub repository:
https://github.com/sowavy234/K2-ghost/issues

---

## 📄 License

This project is open source and available for educational and personal use.

---

## 🎉 Credits

Built with ❤️ for the K2 SE community.

**K2 SE Automagic Enhancement Suite v1.0.0** - Official Release
