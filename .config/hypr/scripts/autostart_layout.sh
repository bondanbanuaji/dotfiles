#!/bin/bash

# tunggu hyprland siap
sleep 2

# spotify
spotify &

# delay dikit
sleep 1

# cava
ghostty --title="cava" -e cava &

# delay dikit
sleep 1

# clock-rs
ghostty --title="clock-rs" -e clock-rs &
