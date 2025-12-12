-- ~/.config/nvim/lua/plugins/obsidian.lua
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = { "markdown" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local vault = vim.fn.expand("~/Documentos/ObsidianVault")

    require("obsidian").setup({
      dir = vault,
      note_ext = ".md",
      ui = { enable = true },

      daily_notes = {
        folder = "Daily",
        date_format = "%Y-%m-%d",
      },
    })

    -- Mapeos globales
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Nueva nota Obsidian" })
    vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "Nota diaria Obsidian" })
    vim.keymap.set("n", "<leader>of", "<cmd>ObsidianFollowLink<CR>", { desc = "Seguir link [[Nota]]" })

    -- Buscar notas con fzf-lua
    vim.keymap.set("n", "<leader>os", function()
      require("fzf-lua").files({
        cwd = vault,
        prompt = "Obsidian> ",
        file_ignore_patterns = { "node_modules", "%.git/" },
      })
    end, { desc = "Buscar notas Obsidian" })
  end,
}
