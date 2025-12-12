-- ~/.config/nvim/lua/plugins/markdown-preview.lua
return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = "cd app && yarn install",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
	init = function()
		vim.g.mkdp_auto_start = 0 -- no abrir automáticamente
		vim.g.mkdp_open_to_the_world = 0 -- localhost only
		vim.g.mkdp_browser = "brave" -- o tu navegador preferido
	end,
}
