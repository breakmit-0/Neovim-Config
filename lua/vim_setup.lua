
-- VIM config
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = ""

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1



vim.g.mapleader = " " -- setting the map leader resets keybinds 

vim.keymap.set("n", "<C-j>", "ddp");
vim.keymap.set("n", "<C-k>", "ddkP");

-- sourround pairs in visual mode
-- vim.keymap.set("v", "(", "xi(<Esc>pa)<Esc>");
-- vim.keymap.set("v", "{", "xi{<Esc>pa}<Esc>");
-- vim.keymap.set("v", "[", "xi[<Esc>pa]<Esc>");
-- vim.keymap.set("v", "|", "xi|<Esc>pa|<Esc>");
-- vim.keymap.set("v", "'", "xi'<Esc>pa'<Esc>");
-- vim.keymap.set("v", "<C-\">", "xi\"<Esc>pa\"<Esc>");


