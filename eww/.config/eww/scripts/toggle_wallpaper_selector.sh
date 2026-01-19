#!/usr/bin/env bash
# toggle_wallpaper_selector.sh

# Usa XDG_RUNTIME_DIR que es estándar en NixOS
STATE_FILE="${XDG_RUNTIME_DIR:-/run/user/$UID}/eww_wallpaper_selector_state"

if [ -f "$STATE_FILE" ]; then
    # Si existe el archivo, la ventana está abierta -> cerrar
    eww close wallpaper-selector
    rm "$STATE_FILE"
else
    # Si no existe, la ventana está cerrada -> abrir
    eww open wallpaper-selector
    touch "$STATE_FILE"
fi
