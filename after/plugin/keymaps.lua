-- ~/.config/nvim/after/plugin/keymaps.lua

local km = vim.keymap
local fzf = require("fzf-lua")
local actions = fzf.actions
local bufdel = require("bufdelete")

-- ──────────────────────────────────────────────────────────────────────────────
-- fzf-lua: Files & Search
-- ──────────────────────────────────────────────────────────────────────────────
km.set("n", "<leader>p", fzf.files, { desc = "FZF Files" }) -- :contentReference[oaicite:0]{index=0}
km.set("n", "<leader>ff", fzf.live_grep, { desc = "FZF Grep" }) -- :contentReference[oaicite:1]{index=1}
km.set("v", "<leader>8", fzf.grep_visual, { desc = "FZF Selection" }) -- :contentReference[oaicite:2]{index=2}
km.set("n", "<leader>7", fzf.grep_cword, { desc = "FZF Word" }) -- :contentReference[oaicite:3]{index=3}
km.set("n", "<leader>j", fzf.helptags, { desc = "Help Tags" }) -- :contentReference[oaicite:4]{index=4}
km.set("n", "<leader><leader>", fzf.resume, { desc = "FZF Resume" }) -- :contentReference[oaicite:5]{index=5}

-- ──────────────────────────────────────────────────────────────────────────────
-- Buffers: listar, y delete sin romper layout
-- ──────────────────────────────────────────────────────────────────────────────
km.set("n", "<leader>b", fzf.buffers, { desc = "FZF Buffers" }) -- :contentReference[oaicite:6]{index=6}
km.set("n", "<leader>d", function() -- bufdelete.nvim: borra buffer actual
	bufdel.bufdelete(0, false) -- :contentReference[oaicite:7]{index=7}
end, { silent = true, desc = "Buffer Delete" })

-- ──────────────────────────────────────────────────────────────────────────────
-- Git: commits y ramas
-- ──────────────────────────────────────────────────────────────────────────────
km.set("n", "<leader>gc", fzf.git_commits, { desc = "Git Commits (repo)" }) -- :contentReference[oaicite:8]{index=8}
km.set("n", "<leader>gbc", fzf.git_bcommits, { desc = "Git Commits (buffer)" }) -- :contentReference[oaicite:9]{index=9}
km.set("n", "<leader>gs", fzf.git_status, { desc = "Git Status" }) -- :contentReference[oaicite:10]{index=10}

-- Ramas: por defecto hace checkout; añadimos acción para borrar
km.set("n", "<leader>gb", function()
	fzf.git_branches({ -- :contentReference[oaicite:11]{index=11}
		actions = {
			["default"] = actions.git_switch, -- hacer checkout de la rama
			["delete"] = actions.git_branch_delete, -- borrar la rama
		},
	})
end, { desc = "Git Branches (switch/delete)" })

-- ──────────────────────────────────────────────────────────────────────────────
-- Operaciones de ficheros: crear, renombrar, eliminar
-- ──────────────────────────────────────────────────────────────────────────────
--  Crear nuevo archivo y abrirlo
km.set("n", "<leader>n", function()
	local fname = vim.fn.input("New file: ", "", "file")
	if fname ~= "" then
		vim.cmd("edit " .. fname)
	end
end, { desc = "New File" })

--  Renombrar archivo actual
km.set("n", "<leader>r", function()
	local old = vim.fn.expand("%:p")
	local new = vim.fn.input("Rename to: ", old, "file")
	if new ~= "" and new ~= old then
		os.rename(old, new) -- :contentReference[oaicite:12]{index=12}
		vim.cmd("edit " .. new)
	end
end, { desc = "Rename File" })

--  Eliminar archivo actual
km.set("n", "<leader>x", function()
	local file = vim.fn.expand("%:p")
	if vim.fn.input("Delete file? (y/N): ") == "y" then
		os.remove(file) -- :contentReference[oaicite:13]{index=13}
		bufdel.bufdelete(0, true)
	end
end, { desc = "Delete File" })

-- ──────────────────────────────────────────────────────────────────────────────
-- Ventanas: navegación y resize
-- ──────────────────────────────────────────────────────────────────────────────
km.set("n", "<Leader><Down>", "<C-W><C-J>", { silent = true, desc = "Window Down" })
km.set("n", "<Leader><Up>", "<C-W><C-K>", { silent = true, desc = "Window Up" })
km.set("n", "<Leader><Right>", "<C-W><C-L>", { silent = true, desc = "Window Right" })
km.set("n", "<Leader><Left>", "<C-W><C-H>", { silent = true, desc = "Window Left" })
km.set("n", "<Leader>wr", "<C-W>R", { silent = true, desc = "Window Swap" })
km.set("n", "<Leader>=", "<C-W>=", { silent = true, desc = "Window Equalise" })
for i = 1, 4 do
	km.set("n", "<Leader>" .. i, i .. "<C-W>w", { desc = "Move to Window " .. i })
end
