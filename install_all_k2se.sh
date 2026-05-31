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

echo "---- K2 SE: Installing example advanced printer.cfg (does not overwrite your own) ----"
cp config/printer.cfg /usr/data/printer_data/config/.AUTOMAGIC_sample_printer.cfg

echo "---- K2 SE: Fluidd Web UI Upgrade ----"
# Replace with your forked fluidd, or just drop-in branding
mkdir -p /usr/share/fluidd/
cp -r fluidd_custom/* /usr/share/fluidd/

echo "---- K2 SE: Upgrading Gumpoy (screen) UI ----"
mkdir -p /usr/share/gumpoy/
cp -r gumpoy_ui/* /usr/share/gumpoy/

echo "---- K2 SE: All automation complete! Rebooting Klipper/Fluidd and UI ----"
# Restart commands for K2 SE platform - modify as per your service setup
systemctl restart klipper
systemctl restart fluidd
systemctl restart gumpoy

echo "---- K2 SE is now fully enhanced! ----"