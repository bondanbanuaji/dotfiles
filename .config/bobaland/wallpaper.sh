#!/usr/bin/env bash

pkill rofi 2>/dev/null

WALLDIR="$HOME/Pictures/Wallpapers"


SELECTED=$(for img in "$WALLDIR"/*; do
  ext="${img##*.}"
  if [[ "$ext" =~ ^(jpg|jpeg|png|gif|webp|mp4|mkv|webm|mov|avi|flv|wmv)$ ]]; then
    echo -en "$(basename "${img%.*}")\0icon\x1f$img\n"
  fi
done | rofi -dmenu -p "  Wallpaper" -theme ~/.config/rofi/retro-dark.rasi -theme-str '
window {width: 500;}
listview {lines: 8;}
')

[ -z "$SELECTED" ] && exit 0

IMG=$(find "$WALLDIR" -type f -name "$SELECTED.*" | head -n 1)
[ -z "$IMG" ] && exit 0

~/.config/bobaland/wallpaper_effects.sh "$IMG"