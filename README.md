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
* **Bootloader**: `GRUB`
* **Boot Splash**: `Plymouth`
* **Login Manager**: `SDDM`

## 📂 Structure
```
.
├── .config/
│   ├── bobaland/       # Personal scripts & tools
│   ├── cava/           # Audio visualizer
│   ├── colors/         # Color schemes
│   ├── fontconfig/     # Font configurations
│   ├── ghostty/        # Ghostty terminal config
│   ├── grub/           # GRUB bootloader config
│   ├── hypr/           # Hyprland window manager
│   ├── nvim/           # Neovim config
│   ├── ohmyposh/       # Shell prompt
│   ├── plymouth/       # Plymouth boot splash
│   ├── rofi/           # Application launcher
│   ├── sddm/           # SDDM login manager theme
│   ├── swaync/         # Notification daemon
│   ├── waybar/         # Status bar
│   └── wlogout/        # Logout menu
├── .tmux/              # Tmux plugins & data
├── .gitignore
├── .stow-local-ignore  # Stow ignore list
├── .tmux.conf          # Tmux configuration
├── .zshrc              # Zsh configuration
├── LICENSE
├── README.md
├── sddm.conf           # SDDM global config
└── update-dotfiles.sh  # Updater script
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
- Scripts in `bobaland/` may need executable permissions: `chmod +x .config/bobaland/*`

## 📜 License

MIT License - Feel free to use and modify as needed!

