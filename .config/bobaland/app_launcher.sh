#!/usr/bin/env bash

if pidof rofi > /dev/null; then
    pkill rofi
fi

rofi -show drun -theme ~/.config/rofi/retro-dark.rasi
