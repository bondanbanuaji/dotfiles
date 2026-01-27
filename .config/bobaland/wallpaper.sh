#!/usr/bin/env bash

pkill rofi 2>/dev/null

WALLDIR="$HOME/Pictures/Wallpapers"

SELECTED=$(for img in "$WALLDIR"/*; do
  echo -en "$(basename "${img%.*}")\0icon\x1f$img\n"
done | rofi -dmenu -p "  Wallpaper" -theme-str '
window {width: 500;}
listview {lines: 8;}
')

[ -z "$SELECTED" ] && exit 0

IMG=$(find "$WALLDIR" -type f -name "$SELECTED.*" | head -n 1)
[ -z "$IMG" ] && exit 0

~/.config/bobaland/wallpaper_effects.sh "$IMG"
