local M = {}

M.setup = function(on_attach, capabilities)
  vim.lsp.config("html", {
    capabilities = capabilities,
    filetypes = { "html" },
    settings = {
      html = {
        format = {
          templating = true,
          wrapLineLength = 120,
          wrapAttributes = "auto",
        },
        hover = {
          documentation = true,
          references = true,
        },
      },
    },
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "html" then
        on_attach(client, args.buf)
      end
    end,
  })

  vim.lsp.enable("html")
end

return M
