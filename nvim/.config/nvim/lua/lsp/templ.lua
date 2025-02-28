local function templ()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

	vim.lsp.config("templ", {
		cmd = { mason_bin .. "templ", "lsp" },
		filetypes = {
			"templ",
		},
	})
	vim.lsp.enable("templ")
end
return templ
