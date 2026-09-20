vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.showmode = true
opt.laststatus = 3
opt.statusline = "%f %m%r%h%w%=%y [%{&ff}] %3p%% %4l/%-4L:%-3c"
opt.winborder = "single"

opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = false
opt.cursorline = true

opt.tabstop = 2
opt.smarttab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.swapfile = false
opt.undofile = true
opt.undolevels = 30000
opt.backup = false
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.linebreak = true
opt.list = true

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.autoread = true
opt.updatetime = 500
opt.timeoutlen = 300
opt.pumheight = 10
