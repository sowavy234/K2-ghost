#!/bin/sh
# K2 SE Automagic All-in-One Installer
# Just runs completely, no prompts, for YOUR K2 SE

echo "---- K2 SE: Backing up your Klipper printer.cfg ----"
cp /usr/data/printer_data/config/printer.cfg /usr/data/printer_data/config/printer.cfg.AUTOMAGIC_BACKUP

echo "---- K2 SE: Installing macros ----"
cp config/macros.cfg /usr/data/printer_data/config/macros.cfg

# If not already included, auto-include macros in printer.cfg
if ! grep -q macros.cfg /usr/data/printer_data/config/printer.cfg ; then
    echo "[include macros.cfg]" >> /usr/data/printer_data/config/printer.cfg
fi

# Auto-include knomi_hi.cfg if it exists
if [ -f config/knomi_hi.cfg ]; then
    cp config/knomi_hi.cfg /usr/data/printer_data/config/knomi_hi.cfg
    if ! grep -q knomi_hi.cfg /usr/data/printer_data/config/printer.cfg ; then
        echo "[include knomi_hi.cfg]" >> /usr/data/printer_data/config/printer.cfg
    fi
fi

echo "---- K2 SE: Installing example advanced printer.cfg (does not overwrite your own) ----"
cp config/printer.cfg /usr/data/printer_data/config/.AUTOMAGIC_sample_printer.cfg

echo "---- K2 SE: Deploying K2-Ghost Gumpoy Screen UI Override ----"
mkdir -p /usr/share/gumpoy/
if [ -d "gumpoy_ui" ]; then
    cp -r gumpoy_ui/* /usr/share/gumpoy/ 2>/dev/null || true
    echo "✓ Gumpoy UI files deployed"
fi

# Backup original Creality styles before override
if [ -f /usr/share/gumpoy/styles.css ]; then
    cp /usr/share/gumpoy/styles.css /usr/share/gumpoy/styles.css.CREALITY_BACKUP
fi

# Deploy K2-Ghost CSS override
if [ -f gumpoy_ui/styles.css ]; then
    cp gumpoy_ui/styles.css /usr/share/gumpoy/styles.css
    echo "✓ K2-Ghost Gumpoy CSS override applied"
fi

echo "---- K2 SE: Fluidd Web UI Upgrade ----"
mkdir -p /usr/share/fluidd/
if [ -d "fluidd_custom" ]; then
    cp -r fluidd_custom/* /usr/share/fluidd/ 2>/dev/null || true
    echo "✓ Fluidd custom files deployed"
fi

echo "---- K2 SE: All automation complete! Rebooting Klipper/Fluidd and UI ----"
# Restart commands for K2 SE platform - modify as per your service setup
if command -v systemctl &> /dev/null; then
    systemctl restart klipper 2>/dev/null || true
    systemctl restart fluidd 2>/dev/null || true
    systemctl restart gumpoy 2>/dev/null || true
else
    # Fallback for systems without systemctl
    /etc/init.d/klipper restart 2>/dev/null || true
    /etc/init.d/fluidd restart 2>/dev/null || true
    /etc/init.d/gumpoy restart 2>/dev/null || true
fi

echo ""
echo "✓ ---- K2 SE is now fully enhanced with K2-Ghost v1.0.0! ----"
echo ""
echo "🎉 Installed Features:"
echo "  ✓ Enhanced Macros (20+ commands)"
echo "  ✓ Creality Knomi Hi Support"
echo "  ✓ K2-Ghost Gumpoy Screen Override (replaces Creality UI)"
echo "  ✓ Advanced Terminal with Gcode Commands"
echo "  ✓ Multiple UI Themes (Light, Dark, Neon)"
echo ""
echo "📖 Documentation: See docs/KNOMI_HI_SETUP.md for setup guide"
echo ""
