#!/usr/bin/env bash
CACHE_FILE="$HOME/.cache/current_wallpaper"

if [ -f "$CACHE_FILE" ]; then
    WALLPAPER=$(cat "$CACHE_FILE")
    if [ -f "$WALLPAPER" ]; then
        ~/.config/bobaland/wallpaper_effects.sh "$WALLPAPER"
    fi
fi
