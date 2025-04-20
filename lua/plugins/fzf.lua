-- En tu archivo de plugins (lua/plugins/init.lua o similar)
return {
	-- fzf-lua: fuzzy finder para todo
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- opcional, para íconos
		config = function()
			require("config.plugins.fzf").setup()
		end,
	},

	-- bufdelete: eliminar buffers sin cerrar ventanas
	{ "famiu/bufdelete.nvim" },
}
