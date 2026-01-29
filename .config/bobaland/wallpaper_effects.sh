#!/usr/bin/env bash
set -e

WALL="$1"
[ -z "$WALL" ] && exit 0

# Save current wallpaper for restoration
echo "$WALL" > "$HOME/.cache/current_wallpaper"

CACHE="$HOME/.cache/swww"
mkdir -p "$CACHE"

NORMAL="$CACHE/wallpaper.png"
BLUR="$CACHE/wallpaper_blur.png"
DARK="$CACHE/wallpaper_dark.png"
VIGNETTE="$CACHE/wallpaper_vignette.png"
LOCK="$CACHE/lock.png"
VIDEO_THUMB="$CACHE/video_thumb.png"

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

# Detect if video
EXT="${WALL##*.}"
IS_VIDEO=false
if [[ "$EXT" =~ ^(mp4|mkv|webm|mov|avi|flv|wmv)$ ]]; then
    IS_VIDEO=true
fi

# Ensure swww is running (needed for both image and video transition)
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon --format xrgb >/dev/null 2>&1 &
    sleep 0.5 
fi

if [ "$IS_VIDEO" = true ]; then
    # VIDEO WALLPAPER LOGIC
    if ! command -v mpvpaper &> /dev/null; then
        notify-send "Error" "mpvpaper not found. Please install it to use video wallpapers."
        exit 1
    fi

    # Kill any existing mpvpaper instances
    pkill mpvpaper || true

    # Extract first frame for transition
    # Use -vf scale to ensure correct size if needed, but swww handles it.
    ffmpeg -y -i "$WALL" -vframes 1 -f image2 "$VIDEO_THUMB" >/dev/null 2>&1
    
    # 1. Start visual transition using swww with the first frame
    swww img "$VIDEO_THUMB" \
      --transition-type "$TRANSITION_TYPE" \
      --transition-pos "$POS" \
      --transition-duration 3.0 \
      --transition-fps 60 \
      --transition-bezier "$BEZIER" \
      --transition-angle $(( RANDOM % 360 )) \
      --transition-step 90

    # 2. Wait for transition to mostly complete
    sleep 3.0

    # 3. Start mpvpaper (seamless handover)
    # Using --no-keepaspect-window or panscan to match typical wallpaper filling
    nohup mpvpaper '*' "$WALL" -o "loop --panscan=1.0" >/dev/null 2>&1 &

    # Copy thumb for lockscreen
    cp "$VIDEO_THUMB" "$LOCK"

else
    # IMAGE WALLPAPER LOGIC
    
    # Kill mpvpaper if running
    pkill mpvpaper || true

    # Ultra smooth transition with randomized elegance
    swww img "$WALL" \
      --transition-type "$TRANSITION_TYPE" \
      --transition-pos "$POS" \
      --transition-duration 3.0 \
      --transition-fps 60 \
      --transition-bezier "$BEZIER" \
      --transition-angle $(( RANDOM % 360 )) \
      --transition-step 90

    # Cache lockscreen base
    cp "$WALL" "$LOCK"
fi

# ═══════════════════════════════════════════════════════════════
# 💎 PREMIUM IMAGE PROCESSING - FOR LOCKSCREEN THUMBNAILS
# ═══════════════════════════════════════════════════════════════

if [ -f "$LOCK" ]; then
    # Ensure vipsthumbnail works on the lock image
    vipsthumbnail "$LOCK" \
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
fi

exit 0