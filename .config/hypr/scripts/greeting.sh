#!/bin/bash
hour=$(date +%H)

if [ $hour -lt 6 ]; then
    echo "🌙 Good Night"
elif [ $hour -lt 12 ]; then
    echo "🌅 Good Morning"
elif [ $hour -lt 18 ]; then
    echo "☀️ Good Afternoon"
else
    echo "🌆 Good Evening"
fi
