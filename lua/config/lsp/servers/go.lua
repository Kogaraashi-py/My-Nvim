local M = {}

M.setup = function(on_attach, capabilities)
  -- ✅ Configurar gopls
  vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
          nilness = true,
        },
        staticcheck = true,
        buildFlags = { "-tags=integration" },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        codelenses = {
          generate = true,
          gc_details = true,
        },
      },
    },
  })

  -- ✅ Configurar on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "gopls" then
        on_attach(client, args.buf)
      end
    end,
  })

  -- ✅ Habilitar el servidor
  vim.lsp.enable("gopls")
end

return M
