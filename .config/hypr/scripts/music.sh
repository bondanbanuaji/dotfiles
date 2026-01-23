#!/bin/bash
# Check if music is playing (supports playerctl)
if command -v playerctl &> /dev/null; then
    status=$(playerctl status 2>/dev/null)
    if [ "$status" = "Playing" ]; then
        artist=$(playerctl metadata artist 2>/dev/null)
        title=$(playerctl metadata title 2>/dev/null)
        
        # Truncate if too long
        if [ ${#title} -gt 30 ]; then
            title="${title:0:27}..."
        fi
        
        echo "󰎈 $artist - $title"
    else
        echo ""
    fi
else
    echo ""
fi
