return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },                    -- Optimización al abrir archivos grandes
      dashboard = require("config.plugins.dashboard"), -- Pantalla de inicio personalizada
      image = { enabled = true },                      -- Soporte para ver imágenes en Kitty/WezTerm
      indent = { enabled = true },                     -- Guías de indentación
      input = { enabled = true },                      -- Interfaz mejorada para vim.ui.input
      lazygit = { enabled = true },                    -- Integración de LazyGit flotante
      notifier = { enabled = true, timeout = 3000 },   -- Notificaciones mejoradas con historial
      notify = { enabled = true },                     -- Mejoras sobre vim.notify
      quickfile = { enabled = true },                  -- Carga rápida de archivos
      --statuscolumn = { enabled = true }, -- Columna de estado enriquecida
      terminal = { enabled = true },                   -- Terminal flotante o dividida
      util = { enabled = true },                       -- Funciones internas utilizadas por otros módulos
      win = { enabled = true },                        -- Gestión de ventanas flotantes/splits personalizados
    },
    keys = {
      {
        "<leader>db",
        function()
          require("snacks").dashboard()
        end,
        desc = "Abrir Dashboard",
      },
      {
        "<leader>lg",
        function()
          require("snacks").lazygit()
        end,
        desc = "Toggle LazyGit",
      },
      {
        "<leader>nt",
        function()
          require("snacks").notifier.show_history()
        end,
        desc = "Historial Notificaciones",
      },
      {
        "<leader>t",
        function()
          require("snacks").terminal()
        end,
        desc = "Toggle Terminal",
      },
    },
  },
}
