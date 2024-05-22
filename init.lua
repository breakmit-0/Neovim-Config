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
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-tree/nvim-tree.lua", lazy = false, name = "nvim-tree", dependencies = {"nvim-tree/nvim-web-devicons"}}
}

require("vim_setup")

local ps = "plugin_setup."

require(ps .. "catpuccin");
require(ps .. "nvim_tree");

vim.keymap.set("n","<leader>tt", ":NvimTreeToggle<CR>")
