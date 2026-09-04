local function oxlint()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("oxlint", {
		cmd = { mason_bin .. "oxlint", "lsp" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_markers = {
			"package.json",
			"oxlint.json",
			"oxlint.jsonc",
		},
	})
	vim.lsp.enable("oxlint")
end

return oxlint
