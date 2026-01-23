#!/bin/bash

echo "🔒 Setting up Hyprlock with dynamic profile picture..."

# Create directories
mkdir -p ~/Pictures/Wallpapers
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/.config/hypr/scripts

# Make scripts executable
chmod +x ~/.config/hypr/scripts/greeting.sh
chmod +x ~/.config/hypr/scripts/battery.sh
chmod +x ~/.config/hypr/scripts/music.sh

# Check if profile picture exists
if [ ! -f ~/Pictures/profile.png ]; then
    echo "⚠️  Profile picture not found at ~/Pictures/profile.png"
    echo "📸 Options:"
    echo "1. Copy your profile picture to ~/Pictures/profile.png"
    echo "2. Or create a symlink: ln -s /path/to/your/pic.jpg ~/Pictures/profile.png"
    echo ""
    read -p "Do you want to use a placeholder? (y/n): " use_placeholder
    
    if [ "$use_placeholder" = "y" ]; then
        # Create a simple gradient placeholder
        convert -size 150x150 gradient:blue-purple ~/Pictures/profile.png 2>/dev/null || {
            echo "⚠️  ImageMagick not installed. Install it with: sudo pacman -S imagemagick"
            echo "Or manually add your profile picture to ~/Pictures/profile.png"
        }
    fi
fi

# Check if lockscreen wallpaper exists
if [ ! -f ~/Pictures/Wallpapers/lockscreen.jpg ]; then
    echo "⚠️  Lockscreen wallpaper not found"
    echo "📁 Please add a wallpaper at ~/Pictures/Wallpapers/lockscreen.jpg"
    echo "Or create a symlink to your current wallpaper:"
    echo "ln -s ~/Pictures/Wallpapers/1053832.jpg ~/Pictures/Wallpapers/lockscreen.jpg"
fi

echo "✅ Setup complete!"
echo "🔄 Reload hyprlock config or lock your screen to see changes"
