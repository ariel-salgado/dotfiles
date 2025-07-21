-- Disable banner
vim.cmd("let g:netrw_banner = 0 ")

-- Visual Settings
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

-- Formatting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- File Swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Search Settings
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI Settings
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Backspace
vim.opt.backspace = { "start", "eol", "indent" }

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Too lazy to group
vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.g.editorconfig = true
