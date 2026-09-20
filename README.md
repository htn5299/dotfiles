# Dotfiles for Fedora (Managed with Chezmoi)

Cấu hình dotfiles cá nhân cho **Fedora Linux**, sử dụng Wayland compositor **Niri**, được quản lý đồng bộ qua [chezmoi](https://www.chezmoi.io/).

---

## 🚀 Quickstart trên máy Fedora mới cài

### Bước 1: Kích hoạt COPR & Cài đặt gói phần mềm

Mở terminal và chạy cụm lệnh sau:

```bash
# 1. Kích hoạt COPR cho Niri & Ghostty
sudo dnf copr enable -y yalter/niri
sudo dnf copr enable -y pgdev/ghostty

# 2. Window Manager, Desktop Components & Audio/Brightness
sudo dnf install -y niri waybar swaync fuzzel waypaper blueman \
                    hypridle hyprlock \
                    brightnessctl playerctl pamixer cliphist wl-clipboard \
                    pipewire-utils pavucontrol acpi jq

# 3. Bộ gõ Tiếng Việt (Fcitx5)
sudo dnf install -y fcitx5 fcitx5-unikey fcitx5-gtk fcitx5-qt

# 4. Terminal, Trình soạn thảo & CLI Utilities
sudo dnf install -y chezmoi git lazygit zsh ghostty neovim \
                    gcc make ripgrep fd-find fzf zoxide eza bat yt-dlp

# 5. Zsh Plugins
sudo dnf install -y zsh-autosuggestions zsh-syntax-highlighting

# 6. Fonts
sudo dnf install -y jetbrains-mono-fonts-all google-noto-sans-fonts
```

> **Cài đặt công cụ phụ trợ (Tuỳ chọn):**
> - **Tomat** (Pomodoro timer cho Waybar): Tải binary đặt vào `~/.local/bin/` hoặc `cargo install tomat`.
> - **Kanata** (Key remapping Caps/Tab): Tải binary từ [jtroo/kanata Releases](https://github.com/jtroo/kanata/releases) và đặt vào `/usr/local/bin/kanata`.

---

### Bước 2: Kéo và áp dụng Dotfiles với Chezmoi

Chỉ với 1 dòng lệnh duy nhất, chezmoi sẽ clone repo về máy và deploy toàn bộ cấu hình vào `$HOME`:

```bash
chezmoi init --apply https://github.com/htn5299/dotfiles
```

*(Hoặc dùng SSH nếu đã add SSH key vào GitHub: `chezmoi init --apply git@github.com:htn5299/dotfiles.git`)*

---

### Bước 3: Thiết lập Zsh làm Shell mặc định & Khởi động lại

```bash
# Đổi default shell sang zsh
chsh -s $(which zsh)

# Bật service uinput & Kanata (nếu dùng)
sudo modprobe uinput
```

Đăng xuất hoặc reboot máy, sau đó chọn session **Niri** tại màn hình đăng nhập.

---

## 📖 Hướng dẫn sử dụng Chezmoi hàng ngày

Chezmoi quản lý file cấu hình bằng cách lưu các file nguồn trong thư mục repo (`~/.local/share/chezmoi/`) và tạo file đích tương ứng trong thư mục `$HOME`.

### 1. Quy ước đặt tên file trong Chezmoi
- File/thư mục bắt đầu bằng dấu chấm (`.`) sẽ có tiền tố `dot_` (ví dụ: `dot_zshrc` $\rightarrow$ `~/.zshrc`, `dot_config/` $\rightarrow$ `~/.config/`).
- File script có quyền thực thi sẽ có tiền tố `executable_` (ví dụ: `dot_local/bin/executable_fuzzel-power-menu`).

---

### 2. Các thao tác thường dùng

#### A. Thêm một file cấu hình mới vào Chezmoi
Khi bạn muốn theo dõi thêm một file config mới (ví dụ `~/.config/btop/btop.conf`):
```bash
chezmoi add ~/.config/btop/btop.conf
```

#### B. Chỉnh sửa cấu hình
Có 2 cách:
- **Cách 1 (Khuyên dùng)**: Dùng lệnh `chezmoi edit` để mở trực tiếp file trong repo:
  ```bash
  chezmoi edit ~/.zshrc
  # Lưu xong, chezmoi sẽ tự động áp dụng ra ~/.zshrc thực tế
  ```
- **Cách 2**: Bạn sửa trực tiếp file ở `~/.config/` như bình thường, sau đó nạp thay đổi vào chezmoi:
  ```bash
  chezmoi re-add
  # hoặc: chezmoi add ~/.config/niri/config.kdl
  ```

#### C. Xem khác biệt trước khi áp dụng
Kiểm tra xem file thực tế trên máy khác gì so với cấu hình trong chezmoi:
```bash
chezmoi diff
```

#### D. Áp dụng thay đổi vào hệ thống
Nếu bạn vừa pull repo mới về hoặc sửa đổi trong source chezmoi:
```bash
chezmoi apply
```

#### E. Đồng bộ lên GitHub
Khi muốn lưu lại các thay đổi mới lên GitHub:
```bash
# Vào thư mục chezmoi source
chezmoi cd

# Dùng Git như bình thường
git status
git add .
git commit -m "feat: update my config"
git push

# Quay lại thư mục trước đó
exit
```

---

## 🧩 Danh sách các module cấu hình

| Thành phần | Đường dẫn trong Dotfiles | Mô tả |
| :--- | :--- | :--- |
| **Niri** | `dot_config/niri/config.kdl` | Window manager, layout, keybindings & autostart |
| **Waybar** | `dot_config/waybar/` | Status bar (theme Base24 Tomorrow Night) |
| **SwayNC** | `dot_config/swaync/` | Trung tâm thông báo & control center |
| **Ghostty** | `dot_config/ghostty/config` | Terminal GPU-accelerated với font JetBrainsMono & palette màu |
| **Starship** | `dot_config/starship.toml` | Prompt shell hiện đại (preset pure/minimal) |
| **Zsh** | `dot_zshrc` | Zsh config, vi-mode, eza aliases, autosuggestions |
| **Neovim** | `dot_config/nvim/` | Lazy.nvim, Native LSP (không dùng Mason), Blink.cmp, Fzf-lua |
| **Fuzzel** | `dot_config/fuzzel/fuzzel.ini` | App launcher & clipboard picker qua Dmenu mode |
| **Power Menu**| `dot_local/bin/executable_fuzzel-power-menu` | Menu tắt/khoá/reboot máy (`Mod+M`) |
| **Hypridle/Lock**| `dot_config/hypr/` | Tự động tắt màn hình, suspend và màn hình khoá |
| **Herdr** | `dot_config/herdr/config.toml` | Multiplexer workspace client config |
| **Kanata** | `dot_config/kanata/kanata.kbd` | Remap Caps $\rightarrow$ Esc/Super, Tab $\rightarrow$ Arrows layer |
