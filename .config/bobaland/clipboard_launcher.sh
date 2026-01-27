#!/usr/bin/env bash

if pidof rofi > /dev/null; then
    pkill rofi
fi

cliphist list | rofi -dmenu -p "Clipboard" -theme ~/.config/rofi/retro-dark.rasi | cliphist decode | wl-copy
