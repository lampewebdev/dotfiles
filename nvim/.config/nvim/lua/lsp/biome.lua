local function biome()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("biome", {
		cmd = { mason_bin .. "biome", "lsp-proxy" },
		filetypes = {
			"htmlangular",
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		root_markers = {
			"biome.json",
			"biome.jsonc",
		},
	})
	vim.lsp.enable("biome")
end
return biome
