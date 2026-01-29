#!/bin/bash

# Ensure cleanup on exit
trap "pkill -f 'cava -p $HOME/.config/waybar/waybar_cava.conf'" EXIT

# Ensure any previous cava instances for waybar are killed
pkill -f "cava -p $HOME/.config/waybar/waybar_cava.conf"

# Run cava with custom config
cava -p "$HOME/.config/waybar/waybar_cava.conf" | sed -u 's/;//g;s/0/ /g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
