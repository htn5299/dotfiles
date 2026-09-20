# Dotfiles (Managed with Chezmoi for Fedora)

Personal dotfiles managed natively with [chezmoi](https://www.chezmoi.io/) for Fedora Linux.

## Quickstart on a fresh Fedora install

### 1. Enable Copr & Install Desktop / CLI tools
```bash
# Enable Niri COPR repository
sudo dnf copr enable -y yalter/niri

# Window Manager, Bar, Notifications & Utilities
sudo dnf install -y niri waybar swaync fuzzel waypaper blueman \
                    brightnessctl playerctl pamixer cliphist wl-clipboard \
                    pipewire-utils pavucontrol acpi jq

# Core Terminal & CLI Tools
sudo dnf install -y chezmoi git zsh neovim gcc make ripgrep fd-find fzf zoxide eza bat yt-dlp

# Zsh Plugins
sudo dnf install -y zsh-autosuggestions zsh-syntax-highlighting

# Fonts (Nerd Font & Noto Sans)
sudo dnf install -y jetbrains-mono-fonts-all google-noto-sans-fonts
```

### 2. Initialize & Apply dotfiles in one command
```bash
chezmoi init --apply https://github.com/<your-username>/dotfiles
```

### 3. Daily workflow
- Edit a file: `chezmoi edit ~/.zshrc` (or edit directly, then `chezmoi add ~/.zshrc`)
- Check diff: `chezmoi diff`
- Apply changes to system: `chezmoi apply`
- Push to GitHub: `chezmoi git status` -> `chezmoi git commit` -> `chezmoi git push`
