local function vtsls()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

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
	})
	vim.lsp.enable("vtsls")
end
return vtsls
