-- Archivo: ~/.config/nvim/lua/custom/floatterminal.lua
local M = {}

M.state = {
	floating = {
		buf = -1,
		win = -1,
	},
	markdown = {
		buf = -1,
		win = -1,
	},
}

-- Función para crear ventana flotante (reutilizable)
local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)
	return { buf = buf, win = win }
end

-- Función para el terminal flotante
function M.toggle_terminal()
	if not vim.api.nvim_win_is_valid(M.state.floating.win) then
		M.state.floating = create_floating_window({ buf = M.state.floating.buf })
		if vim.bo[M.state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(M.state.floating.win)
	end
end

-- Función para la vista previa de markdown
function M.show_markdown_preview()
	local current_file = vim.api.nvim_buf_get_name(0)

	if M.state.markdown.win ~= -1 and vim.api.nvim_win_is_valid(M.state.markdown.win) then
		vim.api.nvim_win_close(M.state.markdown.win, true)
		M.state.markdown.win = -1
	end

	M.state.markdown = create_floating_window()

	local cmd = "mdcat " .. vim.fn.shellescape(current_file)
	vim.fn.termopen(cmd)

	vim.api.nvim_buf_set_option(M.state.markdown.buf, "filetype", "markdown")
	vim.api.nvim_buf_set_option(M.state.markdown.buf, "buflisted", false)
end

-- Configuración final
function M.setup()
	vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
	vim.api.nvim_create_user_command("Floaterminal", M.toggle_terminal, {})
	vim.keymap.set("n", "<leader>tt", ":Floaterminal<CR>", { noremap = true, silent = true })
	vim.api.nvim_create_user_command("MarkdownPreview", M.show_markdown_preview, {})
	vim.keymap.set("n", "<space>mg", ":MarkdownPreview<CR>", { noremap = true, silent = true })
end

return M
