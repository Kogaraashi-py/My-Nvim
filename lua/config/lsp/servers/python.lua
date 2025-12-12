local M = {}

M.setup = function(on_attach, capabilities)
  -- 🔍 Detectar el Python del entorno virtual activo DINÁMICAMENTE
  local function get_python_path()
    -- 1. Primero intenta VIRTUAL_ENV (funciona con vf, venv, virtualenv)
    local venv = os.getenv("VIRTUAL_ENV")
    if venv then
      return venv .. "/bin/python"
    end

    -- 2. Busca un venv en el directorio actual del proyecto
    local cwd = vim.fn.getcwd()
    local venv_patterns = {
      cwd .. "/venv/bin/python",
      cwd .. "/.venv/bin/python",
      cwd .. "/env/bin/python",
    }

    for _, path in ipairs(venv_patterns) do
      if vim.fn.filereadable(path) == 1 then
        return path
      end
    end

    -- 3. Fallback al Python del sistema
    return vim.fn.exepath("python3") or vim.fn.exepath("python")
  end

  -- ✅ Configurar el servidor
  vim.lsp.config("pyright", {
    capabilities = capabilities,
    settings = {
      python = {
        pythonPath = get_python_path(),
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          extraPaths = { "." },
          diagnosticSeverityOverrides = {
            reportUnusedVariable = "warning",
            reportMissingImports = "error",
          },
        },
      },
    },
  })

  -- ✅ Configurar on_attach
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "pyright" then
        on_attach(client, args.buf)
      end
    end,
  })

  -- ✅ Habilitar el servidor
  vim.lsp.enable("pyright")
end

return M
