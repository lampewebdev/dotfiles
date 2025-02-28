local function prettierd()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

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
