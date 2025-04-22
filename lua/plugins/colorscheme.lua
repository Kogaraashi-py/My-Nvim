-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- Elige entre: latte, frappe, macchiato, mocha
				transparent_background = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					telescope = true,
					mason = true,
				},
				custom_highlights = {
					CursorLine = { bg = "#353A54" },
					CursorColumn = { bg = "#353A54" },
					CursorLineNr = { fg = "#9370DB", bold = true },
				},
			})

			-- Aplicar el colorscheme
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
