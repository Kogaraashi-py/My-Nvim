-- ~/.config/nvim/lua/plugins/compiler.lua
return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo", "CompilerStop" },
    keys = {
      { "<F6>",       "<cmd>CompilerOpen<cr>",          desc = "Compiler: Abrir menú" },
      { "<leader>cr", "<cmd>CompilerRedo<cr>",          desc = "Compiler: Re-ejecutar" },
      { "<leader>ct", "<cmd>CompilerToggleResults<cr>", desc = "Compiler: Toggle resultados" },
      { "<leader>cs", "<cmd>CompilerStop<cr>",          desc = "Compiler: Detener" },
    },
    dependencies = {
      {
        "stevearc/overseer.nvim",
        version = "v1.6.0" -- Versión estable sin breaking changes
      },
      -- Telescope es REQUERIDO por compiler.nvim internamente
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim" -- Dependencia de telescope
    },
    opts = {},
    config = function(_, opts)
      -- Configurar overseer primero
      local has_overseer, overseer = pcall(require, "overseer")
      if has_overseer then
        overseer.setup({
          task_list = {
            direction = "bottom",
            min_height = 12,
            max_height = 25,
            default_detail = 1,
          },
        })
      end

      -- Configurar compiler.nvim
      local has_compiler, compiler = pcall(require, "compiler")
      if has_compiler then
        compiler.setup(opts or {})
      end
    end,
  },
}
