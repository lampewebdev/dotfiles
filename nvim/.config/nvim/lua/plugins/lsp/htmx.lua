-- HTMX LSP
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "html", "templ", "htmlangular" },
		config = function()
			local constants = require("lsp.constants")
			local mason_bin = constants.MASON_BIN

			vim.lsp.config("htmx", {
				cmd = { mason_bin .. "htmx-lsp" },
				filetypes = { "html", "templ", "htmlangular" },
				root_markers = { ".git", "go.mod" },
			})
			vim.lsp.enable("htmx")
		end,
	},
}
