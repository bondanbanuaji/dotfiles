#!/bin/bash

# Kill previous cava instances
pkill -f "cava -p"

# Start cava
cava -p ~/.config/cava/config &

# Read and format output for EWW
while read -r line; do
    # Convert binary to bars (simplified)
    echo "$line" | od -An -td2 | awk '{for(i=1;i<=NF;i++) printf "%.0f ", ($i/32768)*20}' | head -c 60
    echo ""
done < /tmp/cava_output
