#!/usr/bin/env bash

if command -v rofimoji &> /dev/null; then
    rofimoji
elif command -v rofi-emoji &> /dev/null; then
    rofi -show emoji -modi emoji
else
    # Fallback: use character mode
    rofi -show character
fi
