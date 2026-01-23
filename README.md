# 🏠 My Arch Linux Dotfiles

This repository contains all of my personal dotfiles for my Arch Linux setup.

## 📦 Included Configurations

This repository includes configuration for:

* **Window Managers**: `Hyprland`
* **Terminals**: `ghostty`
* **Shells**: `zsh`
* **Prompt**: `oh-my-posh`
* **Editors**: `neovim`
* **Multiplexer**: `tmux`
* **Status Bar**: `waybar`
* **Notifications**: `swaync`
* **Launcher**: `rofi`
* **Logout menu**: `wlogout`
* **Audio visualizer**: `cava`

## 📂 Structure
```
.
├── .config/
│   ├── cava/
│   ├── colors/         # Color schemes
│   ├── fontconfig/
│   ├── ghostty/
│   ├── hypr/
│   ├── nvim/
│   ├── ohmyposh/
│   ├── rofi/
│   ├── swaync/
│   ├── viegphunt/      # Personal scripts
│   ├── waybar/
│   └── wlogout/
├── .stow-local-ignore  # Stow ignore list
├── .tmux.conf
├── .zshrc
├── LICENSE
└── README.md
```

## 🚀 Installation

### Prerequisites

Make sure you have `stow` installed:
```bash
sudo pacman -S stow
```

### Clone & Deploy
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Backup existing configs (optional but recommended)
mkdir -p ~/.config-backup
cp -r ~/.config ~/.config-backup/
cp ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
cp ~/.tmux.conf ~/.tmux.conf.backup 2>/dev/null || true

# Deploy all configs using stow
stow .
```

### Selective Installation

If you only want specific configs:
```bash
# Only install Hyprland config
stow -t ~ .config/hypr

# Only install zsh config
stow -t ~ .zshrc
```

## 🔄 Updating Dotfiles

After making changes to your configs:
```bash
cd ~/dotfiles
git add .
git commit -m "Update: description of changes"
git push
```

## 📝 Notes

- Some configs may require additional dependencies
- Check individual config directories for specific requirements
- Scripts in `viegphunt/` may need executable permissions: `chmod +x .config/viegphunt/*`

## 📜 License

MIT License - Feel free to use and modify as needed!

