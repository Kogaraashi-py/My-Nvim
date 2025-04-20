return {

	pickers = {

		files = {

			find = "fd . --type f --hidden --exclude .git", -- 🛠️ Usa el comando fd para buscar archivos

			-- - --type f: solo archivos

			-- - --hidden: incluye archivos ocultos

			-- - --exclude .git: ignora la carpeta .git

		},

		buffers = {

			source = {

				items = vim.api.nvim_list_bufs, -- 📜 Obtiene TODOS los buffers (incluyendo vacíos)

				show = function(buf_id) -- 🎨 Formato de visualización

					local name = vim.api.nvim_buf_get_name(buf_id)

					return name == "" and "[Empty]" or vim.fn.fnamemodify(name, ":t") -- 🏷️ Muestra "[Empty]" o el nombre corto del archivo

				end,

			},

			preview = function(buf_id) -- 🔍 Previsualización del contenido

				return vim.api.nvim_buf_get_lines(buf_id, 0, -1, false) -- 📃 Muestra todas las líneas del buffer

			end,

		},

	},

}

