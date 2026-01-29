#!/bin/bash

# Kill existing instances
pkill -x waybar
pkill -f "cava -p"

# Wait a bit
sleep 1

# Start waybar
waybar &
