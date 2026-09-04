local function get_root_dir(bufnr)
	local match = vim.fs.root(bufnr, {
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
		"package.json",
	})
	if not match then
		return nil
	end
	return match
end

local function eslint()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("eslint", {
		cmd = { mason_bin .. "vscode-eslint-language-server", "--stdio" },
		settings = {
			nodePath = "",
			experimental = {
				useFlatConfig = true,
			},
		},
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
		root_dir = get_root_dir,
	})
	vim.lsp.enable("eslint")
end
return eslint
