-- lua/plugins/mini.lua
return {
	{
		"echasnovski/mini.nvim",
		dir = "~/.local/share/nvim/lazy/mini.nvim", -- Ruta absoluta
		branch = "main",
		enabled = true,
		priority = 1000,
		config = function()
			require("config.plugins.mini").setup()
		end,
	},
}
