local function htmx()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN
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
