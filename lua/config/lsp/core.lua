local M = {}
local vim = vim

local inlay_hint_available = vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable

M.setup_servers = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- Carga bajo demanda de los servidores
  require("config.lsp.servers.python").setup(M.on_attach, capabilities)
  require("config.lsp.servers.go").setup(M.on_attach, capabilities)
  require("config.lsp.servers.lua").setup(M.on_attach, capabilities)
  require("config.lsp.servers.bash").setup(M.on_attach, capabilities)
  require("config.lsp.servers.zsh").setup(M.on_attach, capabilities)

  require("config.lsp.servers.html").setup(M.on_attach, capabilities)
  require("config.lsp.servers.css").setup(M.on_attach, capabilities)
  require("config.lsp.servers.javascript").setup(M.on_attach, capabilities)
  require("config.lsp.servers.react").setup(M.on_attach, capabilities)
  require("config.lsp.servers.emmet").setup(M.on_attach, capabilities)
end

M.on_attach = function(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Función auxiliar para mapeos
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc }) -- ← Coma añadida
  end

  -- Mapeos esenciales
  local mappings = {
    n = {
      ["K"] = { vim.lsp.buf.hover, "Mostrar documentación" },
      ["gd"] = { vim.lsp.buf.definition, "Ir a definición" },
      ["gD"] = { vim.lsp.buf.declaration, "Ir a declaración" },
      ["gr"] = { vim.lsp.buf.references, "Mostrar referencias" },
      ["gi"] = { vim.lsp.buf.implementation, "Ir a implementación" },
      ["<leader>ca"] = { vim.lsp.buf.code_action, "Acciones de código" },
      ["<leader>rn"] = { vim.lsp.buf.rename, "Renombrar símbolo" },
      ["<leader>f"] = {
        function()
          require("conform").format({ async = true })
        end,
        "Formatear código",
      },
      ["<leader>wa"] = { vim.lsp.buf.add_workspace_folder, "Agregar workspace" },
      ["<leader>wr"] = { vim.lsp.buf.remove_workspace_folder, "Remover workspace" },
      ["<leader>wl"] = {
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        "Listar workspaces",
      },
      ["<leader>ds"] = { vim.lsp.buf.document_symbol, "Símbolos del documento" },
      ["<leader>ws"] = { vim.lsp.buf.workspace_symbol, "Buscar símbolo en workspace" },
      ["gl"] = { vim.diagnostic.open_float, "Mostrar diagnóstico en línea" },
    },
  }

  -- Aplicar mapeos
  for mode, map_list in pairs(mappings) do
    for key, mapping in pairs(map_list) do
      map(mode, key, mapping[1], mapping[2])
    end
  end

  -- Resaltado inteligente de referencias
  if client.server_capabilities.documentHighlightProvider then
    local highlight_group = vim.api.nvim_create_augroup("lsp-document-highlight", { clear = false })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = highlight_group,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = highlight_group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("lsp-detach-" .. bufnr, { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = bufnr })
      end,
    })
  end

  -- Inlay Hints (solo si está disponible)
  if client.supports_method("textDocument/inlayHint") then
    map("n", "<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, "Toggle Inlay Hints")
  end
end

return M
