-- ~/.config/nvim/after/plugin/keymaps.lua
-- Keymaps para módulos de 'mini.nvim'
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open(vim.fn.getcwd(), true) -- Abre el explorador
end, { desc = "Explorer" })

-- ~/.config/nvim/after/plugin/keymaps.lua
vim.keymap.set("n", "<leader>p", function()
	require("mini.pick").builtin.files({ tool = "fd" }) -- Usa 'fd' para búsqueda
end, { desc = "Fuzzy Find" })

vim.keymap.set("n", "<leader>bd", function()
	require("mini.bufremove").delete() -- Cierra el buffer
end, { desc = "Close Buffer" })

vim.keymap.set("n", "<leader>gm", function()
	require("mini.git").stage_hunk() -- Stage hunk de Git
end, { desc = "Stage Hunk" })

-- after/plugin/keymaps.lua
-- after/plugin/keymaps.lua
vim.keymap.set("n", "<leader>b", function()
	require("mini.pick").builtin.buffers()
end, { desc = "List buffers" })

-- Agrega este nuevo keymap para una función personalizada de eliminación de buffers
vim.keymap.set("n", "<leader>bk", function()
	-- Obtener lista de buffers
	local buffers = vim.api.nvim_list_bufs()
	local valid_buffers = {}
	local buffer_names = {}

	-- Filtrar buffers válidos y obtener nombres
	for _, buf_id in ipairs(buffers) do
		if vim.api.nvim_buf_is_valid(buf_id) and vim.bo[buf_id].buflisted then
			table.insert(valid_buffers, buf_id)
			local name = vim.api.nvim_buf_get_name(buf_id)
			name = name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":t")
			table.insert(buffer_names, name)
		end
	end

	-- Usar vim.ui.select para mostrar una lista de buffers
	vim.ui.select(buffer_names, {
		prompt = "Selecciona buffer para eliminar:",
		format_item = function(item)
			return item
		end,
	}, function(selected_name, idx)
		if selected_name then
			-- Eliminar el buffer seleccionado
			local buf_id = valid_buffers[idx]
			require("mini.bufremove").delete(buf_id, false)
		end
	end)
end, { desc = "Delete buffer from list" })
