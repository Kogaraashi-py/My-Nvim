return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua",
      "luadoc",
      "python",
      "go",
      "bash",
      "markdown",
      "markdown_inline",
      -- ✅ Web/React
      "javascript",
      "typescript",
      "tsx",
      "json",
      "html",
      "css",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false, -- ← Mejora rendimiento
    },
    indent = {
      enable = true,
    },
    -- ✅ AGREGADO: Selección incremental (muy útil en JSX)
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",   -- Inicia selección
        node_incremental = "<C-space>", -- Expande selección
        scope_incremental = false,
        node_decremental = "<bs>",      -- Reduce selección
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
    },
  },
}
