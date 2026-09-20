# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) and Antigravity when working with code in this repository.

## Architecture & Overview

This repository contains personal dotfiles managed natively with **chezmoi** targeting **Fedora Linux**.
The graphical desktop environment is built around the **Niri** scrollable-tiling Wayland compositor.

Key components and directory structure:
- `dot_config/niri/config.kdl` — Niri Wayland compositor configuration (layout, keybindings, window rules, startup).
- `dot_config/waybar/` — Waybar status bar configuration and styling (`Base24 Tomorrow Night` color scheme).
- `dot_config/swaync/` — SwayNotificationCenter configuration and styling.
- `dot_config/ghostty/` — Ghostty GPU-accelerated terminal configuration with JetBrainsMono font.
- `dot_config/nvim/` — Neovim configuration using `lazy.nvim` and native LSP client (no Mason).
- `dot_config/fuzzel/` — Fuzzel application launcher and dmenu-mode clipboard picker.
- `dot_config/hypr/` — Screen management (`hypridle.conf` for timeouts/suspend, `hyprlock.conf` for lock screen).
- `dot_config/kanata/` — Kanata keyboard layout remapping (`caps` -> tap=Esc / hold=Super, `tab` -> tap=Tab / hold=Arrows).
- `dot_config/tomat/` — Pomodoro timer configuration displayed in Waybar.
- `dot_config/herdr/` — Herdr workspace multiplexer client settings.
- `dot_local/bin/executable_fuzzel-power-menu` — Power menu script invoked by Niri (`Mod+M`).
- `dot_zshrc` — User Zsh configuration (vi-mode, eza aliases, fnm integration, pure Starship prompt).

## Chezmoi Conventions

- **File Naming**:
  - Files and directories that should start with a dot in `$HOME` must be prefixed with `dot_` (e.g. `dot_zshrc` -> `~/.zshrc`, `dot_config/` -> `~/.config/`).
  - Executable scripts must be prefixed with `executable_` (e.g. `dot_local/bin/executable_fuzzel-power-menu`).
- **Editing Files**:
  - Always edit the source files in this repository (`~/.local/share/chezmoi/`), NOT the deployed files in `~/.config/` or `$HOME`.
- **Applying Changes**:
  - After modifying files in this repo, run `chezmoi apply` to deploy changes to the local system.
  - To view changes before applying: `chezmoi diff`.
- **Committing Changes**:
  - Use conventional commits (e.g., `feat:`, `fix:`, `refactor:`, `docs:`).

## Tech Stack & Conventions

- **Target OS**: Fedora Linux. Package management is `dnf` and `copr`.
- **Language & Style**:
  - All documentation, commit messages, and inline code comments must be written in **English**.
- **Compositor Target**:
  - This is a **Niri** desktop. Do not assume or suggest Hyprland (`hyprctl`, Hyprland dispatchers) or Sway-specific tools.
  - X11 apps are handled via `xwayland-satellite`.
  - Do NOT set `GDK_BACKEND` globally as it breaks screencast portals in Niri.
- **Neovim & LSP**:
  - Mason is deliberately omitted. Neovim relies on native system-installed language servers (installed via DNF, Cargo, NPM, etc.).
- **Node.js**:
  - Node version switching is managed by `fnm` (`Fast Node Manager`) via `.nvmrc` or `.node-version`. Do not introduce `nvm` bash wrapper scripts.
- **Colors & Theming**:
  - Palette follows `Base24 Tomorrow Night` (`#191b1d` background, `#c5c8c6` foreground). Colors are directly embedded into respective configs.

## Common Chezmoi Commands

```bash
# Preview diff against target system
chezmoi diff

# Apply changes to home directory
chezmoi apply

# Add a newly tracked file
chezmoi add ~/.config/<path>

# Check git status in chezmoi directory
git status
```
