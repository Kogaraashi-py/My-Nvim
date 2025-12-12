-- config/init.lua
return {
	-- Plugin de Telescope
	--	{
	--		"nvim-telescope/telescope.nvim",
	--		dependencies = { "nvim-lua/plenary.nvim" },
	--		config = function()
	--			require("telescope").setup()
	--			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
	--		end,
	--	},

	-- Configuración LSP (carga todo de config/lsp/init.lua)
	{
		"neovim/nvim-lspconfig",
		--	event = { "BufReadPre", "BufNewFile" }, --optimizacion,cargar solo cuando se abra un archivo
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"stevearc/conform.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"mfussenegger/nvim-lint",
		},
		config = function()
			require("config.lsp").setup() -- ← Ahora sí carga correctamente
		end,
	},
}
