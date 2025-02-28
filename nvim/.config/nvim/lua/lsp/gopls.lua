local function gopls()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")
	vim.lsp.config("gopls", {
		cmd = { mason_bin .. "gopls" },
		filetypes = {
			"go",
			"gomod",
			"gowork",
			"gotmpl",
		},
		root_markers = {
			"go.mod",
		},
	})

	vim.lsp.enable("gopls")
end
return gopls
