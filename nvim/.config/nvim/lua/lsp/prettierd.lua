local function prettierd()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("prettierd", {
		cmd = { mason_bin .. "prettierd" },
		filetypes = {
			"htmlangular",
			"scss",
			"css",
			"html",
			"templ",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
		root_markers = {
			".prettierrc",
			".prettierrc.json",
			".prettierrc.js",
			".prettierrc.cjs",
			".prettierrc.yaml",
			".prettierrc.yml",
			".prettierrc.json5",
			"prettier.config.js",
			"prettier.config.cjs",
			"prettier.config.mjs",
			"prettier.config.ts",
		},
	})
	vim.lsp.enable("prettierd")
end
return prettierd
