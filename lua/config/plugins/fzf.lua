-- lua/config/plugins/fzf.lua
local M = {}

function M.setup()
	require("fzf-lua").setup({
		-- Configuración general
		fzf_opts = {
			["--layout"] = "reverse",
		},
		winopts = {
			height = 0.85,
			width = 0.80,
			preview = {
				scrollbar = "float",
				layout = "vertical",
				vertical = "down:45%",
			},
		},

		-- Configuración de buffers
		buffers = {
			previewer = "buffer",
			actions = {
				["default"] = require("fzf-lua.actions").buf_edit,
				["ctrl-d"] = function(selected)
					-- Integración con bufdelete
					require("bufdelete").bufdelete(selected[1].bufnr, false)
					require("fzf-lua").buffers() -- Refresca la lista
				end,
			},
		},

		-- Configuración de Git
		git = {
			branches = {
				cmd = "git branch --all --color",
				previewer = "git_branch",
			},
			commits = {
				cmd = "git log --pretty=format:'%h %d %s (%cr)' --color",
				previewer = "git_commit",
			},
			status = {
				cmd = "git status -s",
				previewer = "git_status",
			},
		},

		-- Configuración de archivos
		files = {
			fd_opts = "--color=never --type f --hidden --follow --exclude .git",
			previewer = "bat",
		},

		-- LSP
		lsp = {
			code_actions = {
				previewer = "codeaction",
			},
		},
	})
end

return M
