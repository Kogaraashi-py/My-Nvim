require("config.settings")
require("config.lazy")
--require("custom.floaterminal")
--require("custom.floatmcat").setup()
require("custom.floatterminal").setup() -- Cambiado el nombre a floatterminal

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "nc" -- puedes mover el cursor y ver el contenido "oculto"
  end,
})
vim.opt.virtualedit = "all"
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "MD Preview" })
