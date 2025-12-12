return {
  -- Copilot para autocompletado
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = { "Copilot", "CopilotAuth" },
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = true },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
