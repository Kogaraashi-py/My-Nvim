local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").gopls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					shadow = true, -- Nuevo análisis
					nilness = true,
				},
				staticcheck = true,
				buildFlags = { "-tags=integration" },
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
				codelenses = {
					generate = true, -- Habilitar code lens
					gc_details = true,
				},
			},
		},
	})
end

return M
