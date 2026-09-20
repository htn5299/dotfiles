# Dotfiles (Managed with Chezmoi for Fedora)

Personal dotfiles managed natively with [chezmoi](https://www.chezmoi.io/) for Fedora Linux.

## Quickstart on a fresh Fedora install

### 1. Install Chezmoi & tools
```bash
sudo dnf install -y chezmoi git zsh neovim gcc make ripgrep fd-find fzf zoxide eza bat
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
