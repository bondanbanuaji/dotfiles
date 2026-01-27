#!/usr/bin/env bash

THEME="$HOME/.config/rofi/retro-dark.rasi"

if command -v rofimoji &> /dev/null; then
    rofimoji --rofi-args="-theme $THEME"
elif command -v rofi-emoji &> /dev/null; then
    rofi -show emoji -modi emoji -theme "$THEME"
else
    notify-send "Emoji Launcher" "Neither rofimoji nor rofi-emoji is installed"
    rofi -show character -theme "$THEME"
fi
