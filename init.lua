-- require("plugins")
-- require("remap")

-- bootstrap lazy.nvim, maybe move to a module later
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    { "catppuccin/nvim",                  name = "catppuccin", priority = 1000 },
    { "nvim-tree/nvim-tree.lua",          lazy = false,        name = "nvim-tree", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "terrortylor/nvim-comment" },
    { 'windwp/nvim-autopairs', event = "InsertEnter" },
    {'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
    {'FelipeLema/cmp-async-path'}
}



require("vim_setup")
local ps = "plugin_setup."

require(ps .. "comment");
require(ps .. "nvim_tree");
require(ps .. "catpuccin");
require(ps .. "lsp");
require(ps .. "treesitter");
require(ps .. "telescope");
require("nvim-autopairs").setup {}

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")

vim.cmd('set shell=zsh')
