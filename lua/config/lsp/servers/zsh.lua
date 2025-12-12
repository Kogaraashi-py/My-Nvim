local M = {}

M.setup = function(on_attach, capabilities)
  -- ✅ Configurar bashls para zsh (reutilizamos bashls)
  vim.lsp.config("bashls", {
    capabilities = capabilities,
    filetypes = { "zsh" },
    root_markers = { ".git" },
  })

  -- ✅ Configurar on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "bashls" then
        on_attach(client, args.buf)
      end
    end,
  })

  -- ✅ Habilitar el servidor
  vim.lsp.enable("bashls")
end

return M
