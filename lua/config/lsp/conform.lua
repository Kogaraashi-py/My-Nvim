-- config/lsp/conform.lua
local M = {}

M.setup = function()
  require("conform").setup({
    stop_after_first = true,
    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      -- Lenguajes backend/scripting
      python = { "black" },
      lua = { "stylua" },
      go = { "gofmt", "goimports" },
      bash = { "shfmt" },
      zsh = { "shfmt" },

      -- ✅ Web/Frontend (agregado)
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      markdown = { "prettier" },
    },
  })
end

return M
