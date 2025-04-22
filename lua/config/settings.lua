vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("", "<Space>", "<Nop>")
-- Coloca esto en tu lua/config/settings.lua o en un módulo equivalente
local api = vim.api

-- 1. Agrupo de autocomandos para togglear cursorline y cursorcolumn
api.nvim_create_augroup("ActiveCursorCross", { clear = true })

-- Cuando entras a Neovim, entras a ventana, lees buffer o cambias de buffer, activo cursorline & column
api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter", "FocusGained" }, {
	group = "ActiveCursorCross",
	callback = function()
		vim.wo.cursorline = true -- Highlight línea del cursor :contentReference[oaicite:0]{index=0}
		vim.wo.cursorcolumn = true -- Highlight columna del cursor :contentReference[oaicite:1]{index=1}
		-- Opcional: resaltar también el número de línea
		vim.wo.cursorlineopt = "both" -- "both" = línea + número :contentReference[oaicite:2]{index=2}
	end,
})

-- Al salir de la ventana o perder foco, desactivo ambos resaltados
api.nvim_create_autocmd({ "WinLeave", "BufWinLeave", "FocusLost" }, {
	group = "ActiveCursorCross",
	callback = function()
		vim.wo.cursorline = false
		vim.wo.cursorcolumn = false
	end,
})
