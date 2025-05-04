return {
	"vimwiki/vimwiki",
	config = function()
		-- Variable crítica para forzar el uso de extensiones en enlaces
		local vim = vim
		vim.g.vimwiki_create_link = 1 -- Usa extensiones en los enlaces

		-- Mapping para abrir directamente index.md y no index.wiki
		vim.g.vimwiki_list = {
			{
				path = vim.fn.expand("~/vimwiki"),
				syntax = "markdown",
				ext = ".md",
			},
		}

		-- Esta es la configuración clave que faltaba para el manejo de extensiones
		vim.g.vimwiki_ext2syntax = { [".md"] = "markdown" }

		-- Deshabilita la detección global de archivos wiki
		vim.g.vimwiki_global_ext = 0

		-- Fuerza que los archivos nuevos usen .md
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

		-- Fuerza el uso de Markdown para enlaces explícitamente
		vim.g.vimwiki_markdown_link_ext = 1

		-- Mappings básicos de VimWiki
		vim.keymap.set("n", "<Leader>ww", function()
			local index_path = vim.fn.expand("~/vimwiki/index.md")
			vim.cmd("edit " .. index_path)
		end, { desc = "Abrir índice de VimWiki" })

		vim.keymap.set("n", "<Leader>wb", "<BS>", { desc = "Volver atrás en VimWiki" })
	end,
}
