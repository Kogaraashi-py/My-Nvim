local M = {}

M.setup = function(on_attach, capabilities)
  -- Configurar ts_ls para React
  vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "jsx",
      "tsx"
    },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  })

  -- Configurar ESLint para React
  vim.lsp.config("eslint", {
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    settings = {
      workingDirectory = { mode = "auto" },
      format = true,
      validate = "on",
    },
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and (client.name == "ts_ls" or client.name == "eslint") then
        on_attach(client, args.buf)
      end
    end,
  })

  vim.lsp.enable({ "ts_ls", "eslint" })
end

return M
