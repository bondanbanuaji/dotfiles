#!/usr/bin/env bash
set -e

WALL="$1"
[ -z "$WALL" ] && exit 0

CACHE="$HOME/.cache/swww"
mkdir -p "$CACHE"

NORMAL="$CACHE/wallpaper.png"
BLUR="$CACHE/wallpaper_blur.png"
DARK="$CACHE/wallpaper_dark.png"
VIGNETTE="$CACHE/wallpaper_vignette.png"
LOCK="$CACHE/lock.png"

# ───────────────────────────────
# Random cinematic origin (weighted)
# ───────────────────────────────
POSITIONS=(
  # Corners - Classic anchors
  "0.05,0.05" "0.95,0.05" "0.05,0.95" "0.95,0.95"
  "0.1,0.1" "0.9,0.1" "0.1,0.9" "0.9,0.9"
  "0.15,0.15" "0.85,0.15" "0.15,0.85" "0.85,0.85"
  
  # Edge midpoints - Smooth entries
  "0.5,0.05" "0.5,0.95" "0.05,0.5" "0.95,0.5"
  "0.5,0.1" "0.5,0.9" "0.1,0.5" "0.9,0.5"
  
  # Golden ratio points - Aesthetic perfection
  "0.382,0.382" "0.618,0.382" "0.382,0.618" "0.618,0.618"
  "0.382,0.5" "0.618,0.5" "0.5,0.382" "0.5,0.618"
  
  # Thirds rule - Photography composition
  "0.333,0.333" "0.667,0.333" "0.333,0.667" "0.667,0.667"
  "0.333,0.5" "0.667,0.5" "0.5,0.333" "0.5,0.667"
  
  # Off-center subtle - Modern minimalism
  "0.25,0.25" "0.75,0.25" "0.25,0.75" "0.75,0.75"
  "0.4,0.3" "0.6,0.3" "0.4,0.7" "0.6,0.7"
  "0.3,0.4" "0.7,0.4" "0.3,0.6" "0.7,0.6"
  
  # Diagonal dynamics - Kinetic energy
  "0.2,0.3" "0.8,0.3" "0.2,0.7" "0.8,0.7"
  "0.3,0.2" "0.7,0.2" "0.3,0.8" "0.7,0.8"
  
  # Center weighted - Safe but elegant
  "0.5,0.5" "0.45,0.45" "0.55,0.55" "0.45,0.55" "0.55,0.45"
)

POS=${POSITIONS[RANDOM % ${#POSITIONS[@]}]}

# Random transition type selection (weighted for best aesthetics)
TRANSITIONS=("grow" "grow" "grow" "wave" "wave" "wipe" "outer")
TRANSITION_TYPE=${TRANSITIONS[RANDOM % ${#TRANSITIONS[@]}]}

# Bezier curves for different moods
BEZIERS=(
  ".25,.1,.25,1"    # Ease-in-out (smooth, professional)
  ".33,0,.67,1"     # Ease-in-out-cubic (balanced)
  ".42,0,.58,1"     # Ease-in-out-sine (gentle)
  ".16,.84,.44,1"   # Custom ease (cinematic)
  ".22,.61,.36,1"   # Anticipation (playful)
)
BEZIER=${BEZIERS[RANDOM % ${#BEZIERS[@]}]}

# Ultra smooth transition with randomized elegance
swww img "$WALL" \
  --transition-type "$TRANSITION_TYPE" \
  --transition-pos "$POS" \
  --transition-duration 4.8 \
  --transition-fps 120 \
  --transition-bezier "$BEZIER" \
  --transition-angle $(( RANDOM % 360 )) \
  --transition-step 90

# ═══════════════════════════════════════════════════════════════
# 💎 PREMIUM IMAGE PROCESSING - Museum Quality
# ═══════════════════════════════════════════════════════════════

# Cache lockscreen base
cp "$WALL" "$LOCK"

# High-quality thumbnail with intelligent cropping
vipsthumbnail "$WALL" \
  --size 2560x1440 \
  --smartcrop attention \
  --linear \
  -o "$NORMAL"

# ───────────────────────────────────────────────────────────────
# 🌫️ Luxe Glass Blur - Premium Glassmorphism
# ───────────────────────────────────────────────────────────────
vips gaussianblur "$NORMAL" "$BLUR" 28 --precision integer
vips linear "$BLUR" "$BLUR" 1.05 2

# ───────────────────────────────────────────────────────────────
# 🌑 Cinematic Depth + Vignette - Film Grade
# ───────────────────────────────────────────────────────────────
vips linear "$NORMAL" "$DARK" 0.62 -8
vips vignette "$DARK" "$VIGNETTE" \
  --radius 0.92 \
  --strength 0.38

exit 0
