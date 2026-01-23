#!/usr/bin/env bash

if pidof rofi > /dev/null; then
    pkill rofi
fi

wallpapers_dir="$HOME/Pictures/Wallpapers"

selected_wallpaper=$(for a in "$wallpapers_dir"/*; do
    echo -en "$(basename "${a%.*}")\0icon\x1f$a\n"
done | rofi -dmenu -p " ")

[ -z "$selected_wallpaper" ] && exit

image_fullname_path=$(find "$wallpapers_dir" -type f -name "$selected_wallpaper.*" | head -n 1)

swww img "$image_fullname_path" --transition-type any --transition-duration 2

cp "$image_fullname_path" ~/.cache/swww/lock.png

# efek tambahan lu tetep jalan
~/.config/viegphunt/wallpaper_effects.sh
