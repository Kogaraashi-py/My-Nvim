local M = {}

M.setup = function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "pyright", "gopls", "lua_ls", "bashls", "zls", "marksman" },
	})
end

return M
