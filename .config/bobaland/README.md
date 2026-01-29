# Bobaland Wallpaper System 🌸

This directory contains the custom wallpaper management scripts for the **Bobaland** desktop environment. It supports both static images and premium video live wallpapers with cinematic transitions.

## 📦 Requirements

To ensure all features (video playback, transitions, thumbnail generation) work correctly, you must install the following dependencies.

### Core Dependencies

| Package | Purpose |
| :--- | :--- |
| **`swww`** | Manages static wallpapers and handles the transition animations. |
| **`mpvpaper`** | Required for playing video wallpapers (`.mp4`, `.mkv`, etc.). |
| **`ffmpeg`** | Used to extract video frames for seamless transitions and lockscreens. |
| **`libvips`** | High-performance image processing for generating glass/blur effects. |
| **`rofi`** | The menu interface for selecting wallpapers. |

### Installation

You can install these packages on Arch Linux using `pacman` and an AUR helper (like `paru` or `yay`).

```bash
# Official repositories
sudo pacman -S ffmpeg libvips rofi

# AUR (swww and mpvpaper)
yay -S swww mpvpaper
# OR
paru -S swww mpvpaper
```

## 🚀 Usage

### Wallpaper Selector AND Live Wallpaper
Runs the Rofi menu to select a wallpaper (Image or Video).
```bash
~/.config/bobaland/wallpaper.sh
```

### Random Wallpaper
Picks a random wallpaper from your collection (Image or Video) with effects.
```bash
~/.config/bobaland/wallpaper_random.sh
```

## 📂 File Structure

- **`wallpaper.sh`**: Main launcher script.
- **`wallpaper_effects.sh`**: The brain. Handles logic for `swww` vs `mpvpaper`, transitions, and effects.
- **`wallpaper_random.sh`**: Randomizer script.

---
*Created for the Bobaland Rice*
