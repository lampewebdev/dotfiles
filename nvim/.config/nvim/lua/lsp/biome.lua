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
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_markers = {
			".eslintrc",
			".eslintrc.js",
			".eslintrc.cjs",
			".eslintrc.yaml",
			".eslintrc.yml",
			".eslintrc.json",
			"eslint.config.js",
			"eslint.config.mjs",
			"eslint.config.cjs",
			"eslint.config.ts",
			"eslint.config.mts",
			"eslint.config.cts",
		},
	})
	vim.lsp.enable("biome")
end
return biome
