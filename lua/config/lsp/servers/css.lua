local M = {}

M.setup = function(on_attach, capabilities)
  vim.lsp.config("cssls", {
    capabilities = capabilities,
    filetypes = { "css", "scss", "less" },
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      scss = {
        validate = true,
      },
      less = {
        validate = true,
      },
    },
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "cssls" then
        on_attach(client, args.buf)
      end
    end,
  })

  vim.lsp.enable("cssls")
end

return M
