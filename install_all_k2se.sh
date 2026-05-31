#!/bin/sh
# K2 SE Automagic All-in-One Installer (AUTO OVERWRITE)
# Overwrites all target files without confirmation!

BACKUP_DIR="/usr/data/printer_data/config/ghostprinter_backup"

mkdir -p "$BACKUP_DIR"

# Backup before overwrite
cp /usr/data/printer_data/config/printer.cfg $BACKUP_DIR/printer.cfg.$(date +%Y%m%d-%H%M%S) 2>/dev/null
cp /usr/data/printer_data/config/macros.cfg $BACKUP_DIR/macros.cfg.$(date +%Y%m%d-%H%M%S) 2>/dev/null

echo "---- Overwriting macros.cfg ----"
cp -f config/macros.cfg /usr/data/printer_data/config/macros.cfg

echo "---- Ensuring include in printer.cfg ----"
CONFIG=/usr/data/printer_data/config/printer.cfg
grep -q "macros.cfg" $CONFIG || echo "[include macros.cfg]" >> $CONFIG

echo "---- Deploying sample printer.cfg ----"
cp -f config/printer.cfg /usr/data/printer_data/config/.AUTOMAGIC_sample_printer.cfg

echo "---- Deploying Fluidd UI ----"
mkdir -p /usr/share/fluidd
cp -rf fluidd_custom/* /usr/share/fluidd/

echo "---- Deploying Gumpoy Screen UI ----"
mkdir -p /usr/share/gumpoy
cp -rf gumpoy_ui/* /usr/share/gumpoy/

echo "---- Restarting services ----"
systemctl restart klipper 2>/dev/null
systemctl restart fluidd 2>/dev/null
systemctl restart gumpoy 2>/dev/null

echo "---- GHOST.PRINTER Complete. All files auto-overwritten. ----"