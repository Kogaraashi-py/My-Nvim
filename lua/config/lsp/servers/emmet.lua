local M = {}

M.setup = function(on_attach, capabilities)
  vim.lsp.config("emmet_ls", {
    capabilities = capabilities,
    filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "emmet_ls" then
        on_attach(client, args.buf)
      end
    end,
  })

  vim.lsp.enable("emmet_ls")
end

return M
