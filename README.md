# Dotfiles for Fedora (Managed with Chezmoi)

Personal dotfiles configuration for **Fedora Linux**, using the **Niri** Wayland compositor, managed and synchronized via [chezmoi](https://www.chezmoi.io/).

---

## 🚀 Quickstart on a Fresh Fedora Installation

### Step 1: Enable COPR Repositories & Install Packages

Open terminal and run:

```bash
# 1. Enable COPR for Niri & Ghostty
sudo dnf copr enable -y yalter/niri
sudo dnf copr enable -y pgdev/ghostty

# 2. Window Manager, Desktop Components & Audio/Brightness
sudo dnf install -y niri waybar swaync fuzzel waypaper blueman \
                    hypridle hyprlock \
                    brightnessctl playerctl pamixer cliphist wl-clipboard \
                    pipewire-utils pavucontrol acpi jq

# 3. Input Method (Vietnamese / Fcitx5)
sudo dnf install -y fcitx5 fcitx5-unikey fcitx5-gtk fcitx5-qt

# 4. Terminal, Editor & Core CLI Utilities
sudo dnf install -y chezmoi git lazygit zsh ghostty neovim \
                    gcc make ripgrep fd-find fzf zoxide eza bat yt-dlp

# 5. Zsh Plugins
sudo dnf install -y zsh-autosuggestions zsh-syntax-highlighting

# 6. Fonts
sudo dnf install -y jetbrains-mono-fonts-all google-noto-sans-fonts
```

> **Optional Auxiliary Tools:**
> - **Tomat** (Pomodoro timer for Waybar): Place pre-built binary into `~/.local/bin/` or install via `cargo install tomat`.
> - **Kanata** (Keyboard remapping for Caps/Tab): Download binary from [jtroo/kanata Releases](https://github.com/jtroo/kanata/releases) to `/usr/local/bin/kanata`.

---

### Step 2: Initialize & Apply Dotfiles with Chezmoi

With a single command, chezmoi clones this repository and deploys all configuration files directly into `$HOME`:

```bash
chezmoi init --apply https://github.com/htn5299/dotfiles
```

*(Or via SSH if your SSH key is added to GitHub: `chezmoi init --apply git@github.com:htn5299/dotfiles.git`)*

---

### Step 3: Set Zsh as Default Shell & Reboot

```bash
# Set zsh as the default login shell
chsh -s $(which zsh)

# Enable uinput module for Kanata (if used)
sudo modprobe uinput
```

Log out or reboot your machine, then select the **Niri** session at your login screen.

---

## 📖 Daily Chezmoi Workflow Guide

Chezmoi stores the source configuration files in `~/.local/share/chezmoi/` and applies the target files into `$HOME`.

### 1. File Naming Conventions in Chezmoi
- Dotfiles/directories prefixed with a dot (`.`) are stored with a `dot_` prefix (e.g., `dot_zshrc` $\rightarrow$ `~/.zshrc`, `dot_config/` $\rightarrow$ `~/.config/`).
- Executable scripts use an `executable_` prefix (e.g., `dot_local/bin/executable_fuzzel-power-menu`).

---

### 2. Common Operations

#### A. Add a new configuration file to Chezmoi
To track an existing configuration file (e.g., `~/.config/btop/btop.conf`):
```bash
chezmoi add ~/.config/btop/btop.conf
```

#### B. Edit configuration files
Two approaches:
- **Approach 1 (Recommended)**: Use `chezmoi edit` to edit the source file directly:
  ```bash
  chezmoi edit ~/.zshrc
  # Upon saving, changes are automatically applied to ~/.zshrc
  ```
- **Approach 2**: Modify the target file in `~/.config/` as usual, then re-add:
  ```bash
  chezmoi re-add
  # or: chezmoi add ~/.config/niri/config.kdl
  ```

#### C. Preview diff before applying
Check changes between your actual home directory and the chezmoi source:
```bash
chezmoi diff
```

#### D. Apply changes to system
Apply updates from the repository to your home directory:
```bash
chezmoi apply
```

#### E. Push changes to GitHub
```bash
# Navigate to the chezmoi source directory
chezmoi cd

# Use standard Git commands
git status
git add .
git commit -m "feat: update my config"
git push

# Return to your previous directory
exit
```

---

## 🧩 Configuration Modules Overview

| Component | Path in Dotfiles | Description |
| :--- | :--- | :--- |
| **Niri** | `dot_config/niri/config.kdl` | Window manager, scrolling layout, keybindings & autostart |
| **Waybar** | `dot_config/waybar/` | Status bar (Base24 Tomorrow Night theme) |
| **SwayNC** | `dot_config/swaync/` | Notification daemon & control center |
| **Ghostty** | `dot_config/ghostty/config` | GPU-accelerated terminal with JetBrainsMono font & custom palette |
| **Starship** | `dot_config/starship.toml` | Minimal prompt preset (Pure-like) |
| **Zsh** | `dot_zshrc` | Zsh config, vi-mode, eza aliases, syntax-highlighting & autosuggestions |
| **Neovim** | `dot_config/nvim/` | Lazy.nvim, Native LSP (no Mason), Blink.cmp, Fzf-lua |
| **Fuzzel** | `dot_config/fuzzel/fuzzel.ini` | Application launcher & clipboard picker in Dmenu mode |
| **Power Menu**| `dot_local/bin/executable_fuzzel-power-menu` | Power / Lock / Reboot menu (`Mod+M`) |
| **Hypridle/Lock**| `dot_config/hypr/` | Idle management, screen blanking, suspend & lockscreen |
| **Herdr** | `dot_config/herdr/config.toml` | Multiplexer workspace client config |
| **Kanata** | `dot_config/kanata/kanata.kbd` | Caps $\rightarrow$ Esc/Super, Tab $\rightarrow$ Arrows layer remapping |
