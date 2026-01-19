#!/usr/bin/env bash
# list_wallpapers.sh

WALLPAPER_DIR="$HOME/Images/Wallpapers"

# Encuentra los wallpapers y crea un array JSON
echo -n "["
first=true
find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | while read -r file; do
    filename=$(basename "$file")
    if [ "$first" = true ]; then
        echo -n "\"$filename\""
        first=false
    else
        echo -n ",\"$filename\""
    fi
done
echo "]"
