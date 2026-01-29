#!/usr/bin/env bash
wallpapers_dir="$HOME/Pictures/Wallpapers"
random_wallpaper=$(find "$wallpapers_dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.webm" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.flv" -o -iname "*.wmv" \) | shuf -n 1)
# Delegate to wallpaper_effects.sh to handle swww vs mpvpaper logic
~/.config/bobaland/wallpaper_effects.sh "$random_wallpaper"