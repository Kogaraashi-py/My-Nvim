-- ~/.config/nvim/lua/config/keymaps.lua
vim.keymap.set("n", "<C-w>v", "<Cmd>vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
vim.keymap.set("n", "<C-w>s", "<Cmd>split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
