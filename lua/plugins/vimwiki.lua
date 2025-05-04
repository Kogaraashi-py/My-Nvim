return {
	"vimwiki/vimwiki",
	-- Estas son las líneas clave para la optimización:
	keys = "<Leader>wop", -- Cargar cuando presiones la tecla líder seguida de 'w'
	cmd = { "VimwikiIndex", "VimwikiDiaryIndex" }, -- Cargar solo cuando ejecutes estos comandos

	-- Mantén tu configuración actual moviendo parte a init y parte a config:
	init = function()
		-- Esta parte se ejecuta siempre, incluso antes de que se cargue el plugin
		local vim = vim
		vim.g.vimwiki_create_link = 1 -- Usa extensiones en los enlaces
		vim.g.vimwiki_list = {
			{
				path = vim.fn.expand("~/vimwiki"),
				syntax = "markdown",
				ext = ".md",
			},
		}
		vim.g.vimwiki_ext2syntax = { [".md"] = "markdown" }
		vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_markdown_link_ext = 1
	end,

	config = function()
		-- Esta parte se ejecuta solo cuando el plugin se carga efectivamente
		-- Configura autocmd y mappings
		vim.api.nvim_create_autocmd("BufNewFile", {
			pattern = "*/vimwiki/*.wiki",
			callback = function(ev)
				-- Obtener el nombre del archivo actual sin extensión
				local filename = vim.fn.expand("%:r")
				-- Cerrar el buffer actual
				vim.cmd("bdelete")
				-- Abrir el archivo con extensión .md en su lugar
				vim.cmd("edit " .. filename .. ".md")
			end,
		})

		-- Mappings básicos de VimWiki
		vim.keymap.set("n", "<Leader>ww", function()
			local index_path = vim.fn.expand("~/vimwiki/index.md")
			vim.cmd("edit " .. index_path)
		end, { desc = "Abrir índice de VimWiki" })
		vim.keymap.set("n", "<Leader>wb", "<BS>", { desc = "Volver atrás en VimWiki" })
	end,
}
