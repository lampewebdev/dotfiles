local function htmx()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")
	vim.lsp.config("htmx", {
		cmd = { mason_bin .. "htmx-lsp" },
		filetypes = {
			"html",
			"templ",
		},
		root_markers = {
			"go.mod",
		},
	})
	vim.lsp.enable("htmx")
end
return htmx
