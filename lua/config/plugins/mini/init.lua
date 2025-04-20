-- lua/config/plugins/mini/init.lua
local M = {}

function M.setup()
	-- 1) Texto / edición
	require("mini.ai").setup()
	require("mini.surround").setup()
	require("mini.pairs").setup()
	require("mini.comment").setup()

	-- 2) Workflow / navegación
	require("mini.files").setup(require("config.plugins.mini.files"))

	require("mini.bufremove").setup()

	-- lua/config/plugins/mini.lua (dentro de M.setup())
	require("mini.pick").setup(require("config.plugins.mini.pick"))

	-- 3) Git inline
	require("mini.git").setup()

	-- 4) Apariencia
	require("mini.statusline").setup()
	require("mini.icons").setup()
	require("mini.indentscope").setup()
end

return M
