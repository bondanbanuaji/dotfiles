#!/bin/bash
battery_path="/sys/class/power_supply/BAT0"

if [ -d "$battery_path" ]; then
    capacity=$(cat $battery_path/capacity)
    status=$(cat $battery_path/status)
    
    if [ "$status" = "Charging" ]; then
        icon="󰂄"
    elif [ $capacity -gt 80 ]; then
        icon="󰁹"
    elif [ $capacity -gt 60 ]; then
        icon="󰂀"
    elif [ $capacity -gt 40 ]; then
        icon="󰁾"
    elif [ $capacity -gt 20 ]; then
        icon="󰁼"
    else
        icon="󰁺"
    fi
    
    echo "$icon $capacity%"
else
    echo ""
fi
