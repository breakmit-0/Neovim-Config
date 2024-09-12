
require("telescope").setup{};
local tl = require("telescope.builtin");

vim.keymap.set("n", "<leader>ff", tl.find_files);
vim.keymap.set("n", "fg", tl.live_grep);
vim.keymap.set("n", "fw", tl.grep_string);
