local function html()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("html", {
		cmd = { mason_bin .. "vscode-html-language-server", "--stdio" },
		filetypes = {
			"htmlangular",
			"html",
			"templ",
		},
	})
	vim.lsp.enable("html")
end

return html
