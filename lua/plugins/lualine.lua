-- lua/plugins/lualine.lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			globalstatus = true, -- Barra única para toda la ventana
			icons_enabled = true,
			theme = {
				-- Colores base Catppuccin macchiato
				normal = {
					a = { fg = "#1e2030", bg = "#f5bde6", gui = "bold" },
					b = { fg = "#cad3f5", bg = "#313244" },
					c = { fg = "#cad3f5", bg = "#1e2030" },
				},
				insert = {
					a = { fg = "#1e2030", bg = "#a6e3a1", gui = "bold" },
				},
				visual = {
					a = { fg = "#1e2030", bg = "#89dceb", gui = "bold" },
				},
				replace = {
					a = { fg = "#1e2030", bg = "#f28fad", gui = "bold" },
				},
				command = {
					a = { fg = "#1e2030", bg = "#f5e0dc", gui = "bold" },
				},
				inactive = {
					a = { fg = "#727169", bg = "#1e2030", gui = "bold" },
					b = { fg = "#727169", bg = "#1e2030" },
					c = { fg = "#727169", bg = "#1e2030" },
				},
			},
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { statusline = {}, winbar = {} },
			always_divide_middle = true,
			refresh = { statusline = 100, tabline = 100, winbar = 100 },
		},
		sections = {
			lualine_a = {
				{ "mode", separator = { left = "", right = "" }, padding = 1 },
			},
			lualine_b = {
				{
					"branch",
					icon = "",
					fmt = function(str)
						return str:upper()
					end,
				},
				{ "diff", colored = true, symbols = { added = "+", modified = "~", removed = "-" } },
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
					colored = true,
					update_in_insert = false,
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1, -- ruta completa con '~'
					shorting_target = 40,
					symbols = { modified = "[+]", readonly = "[-]" },
				},
			},
			lualine_x = {
				{ "encoding", icon = "" },
				{ "fileformat", icons_enabled = true },
				{ "filetype", icon_only = true, separator = { left = "", right = "" } },
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					"filename",
					path = 1,
					file_status = false,
					color = { fg = "#727169", gui = "italic" },
				},
			},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = { "quickfix", "nvim-tree", "neo-tree", "fugitive", "lazy" },
	},
}
