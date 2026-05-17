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
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"vue",
			"svelte",
		},
	})
	vim.lsp.enable("prettierd")
end
return prettierd
