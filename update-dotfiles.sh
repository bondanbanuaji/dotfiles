#!/bin/bash

echo "🔄 Updating dotfiles from system..."

# Copy configs
cp -r ~/.config/cava/* .config/cava/ 2>/dev/null || true
cp -r ~/.config/colors/* .config/colors/ 2>/dev/null || true
cp -r ~/.config/fontconfig/* .config/fontconfig/ 2>/dev/null || true
cp -r ~/.config/ghostty/* .config/ghostty/ 2>/dev/null || true
cp -r ~/.config/hypr/* .config/hypr/ 2>/dev/null || true
cp -r ~/.config/nvim/* .config/nvim/ 2>/dev/null || true
cp -r ~/.config/ohmyposh/* .config/ohmyposh/ 2>/dev/null || true
cp -r ~/.config/rofi/* .config/rofi/ 2>/dev/null || true
cp -r ~/.config/swaync/* .config/swaync/ 2>/dev/null || true
cp -r ~/.config/viegphunt/* .config/viegphunt/ 2>/dev/null || true
cp -r ~/.config/waybar/* .config/waybar/ 2>/dev/null || true
cp -r ~/.config/wlogout/* .config/wlogout/ 2>/dev/null || true
cp ~/.tmux.conf . 2>/dev/null || true
cp ~/.zshrc . 2>/dev/null || true

echo "✅ Dotfiles updated!"
echo "📝 Don't forget to commit and push changes!"

