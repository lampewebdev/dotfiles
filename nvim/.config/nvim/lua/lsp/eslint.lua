local function get_root_dir(bufnr)
	return vim.fs.root(bufnr, {
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
		root_dir = function(bufnr, on_dir)
			local root = get_root_dir(bufnr)
			if root then
				on_dir(root)
			end
		end,
	})
	vim.lsp.enable("eslint")
end
return eslint
