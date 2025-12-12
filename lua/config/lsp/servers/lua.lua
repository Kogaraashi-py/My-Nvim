local M = {}
local vim = vim

M.setup = function(on_attach, capabilities)
  -- ✅ Configurar el servidor
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
          special = {
            reload = "require",
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
          maxPreload = 50,
          preloadFileSize = 25,
        },
        telemetry = { enable = false },
        hint = {
          enable = true,
          arrayIndex = "Disable",
          paramType = true,
          paramName = "All",
          setType = true,
        },
        diagnostics = {
          enable = true,
          globals = { "vim" },
          disable = {
            "missing-parameter",
            "trailing-space",
            "redundant-parameter",
            "undefined-doc-name",
            "unused-local",
            "missing-fields",
            "mixed-table",
          },
          groupSeverity = {
            strong = "Warning",
            strict = "Error",
          },
        },
      },
    },
  })

  -- ✅ Configurar on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "lua_ls" then
        on_attach(client, args.buf)
      end
    end,
  })

  -- ✅ Habilitar el servidor
  vim.lsp.enable("lua_ls")
end

return M
