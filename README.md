# Dotfiles (Managed with Chezmoi for Fedora)

Personal dotfiles managed natively with [chezmoi](https://www.chezmoi.io/) for Fedora Linux.

## Quickstart on a fresh Fedora install

### 1. Enable Copr & Install Desktop / CLI tools
```bash
# Enable Niri COPR repository
sudo dnf copr enable -y yalter/niri

# Window Manager, Bar, Notifications, Idle/Lock & Utilities
sudo dnf install -y niri waybar swaync fuzzel waypaper blueman \
                    hypridle hyprlock \
                    brightnessctl playerctl pamixer cliphist wl-clipboard \
                    pipewire-utils pavucontrol acpi jq

# Input Method (Tiếng Việt)
sudo dnf install -y fcitx5 fcitx5-unikey fcitx5-gtk fcitx5-qt

# Core Terminal, CLI & Dev Tools
sudo dnf install -y chezmoi git lazygit zsh neovim gcc make ripgrep fd-find fzf zoxide eza bat yt-dlp

# Zsh Plugins
sudo dnf install -y zsh-autosuggestions zsh-syntax-highlighting

# Fonts (Nerd Font & Noto Sans)
sudo dnf install -y jetbrains-mono-fonts-all google-noto-sans-fonts
```

> **Ghi chú về Kanata & Tomat:**
> - **Kanata** (remap phím Caps/Tab): Tải binary từ GitHub release (`jtroo/kanata`) hoặc cài qua `cargo install kanata`, copy file config từ `~/.config/kanata/kanata.kbd`.
> - **Tomat** (Pomodoro timer trên Waybar): Cài đặt qua cargo `cargo install tomat` hoặc download binary vào `~/.local/bin/`.

### 2. Initialize & Apply dotfiles in one command
```bash
chezmoi init --apply https://github.com/<your-username>/dotfiles
```

### 3. Daily workflow
- Edit a file: `chezmoi edit ~/.zshrc` (or edit directly, then `chezmoi add ~/.zshrc`)
- Check diff: `chezmoi diff`
- Apply changes to system: `chezmoi apply`
- Push to GitHub: `chezmoi git status` -> `chezmoi git commit` -> `chezmoi git push`
