local function vtsls()
	local constants = require("lsp.constants")
	local shared = require("lsp.shared")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("vtsls", {
		cmd = { mason_bin .. "vtsls", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_markers = {
			"tsconfig.json",
		},
		settings = shared.typescript_settings,
	})
	vim.lsp.enable("vtsls")
end
return vtsls
