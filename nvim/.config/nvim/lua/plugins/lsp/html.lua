-- HTML LSP
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "html", "htmlangular" },
		config = function()
			local constants = require("lsp.constants")
			local mason_bin = constants.MASON_BIN

			vim.lsp.config("html", {
				cmd = { mason_bin .. "vscode-html-language-server", "--stdio" },
				filetypes = { "htmlangular", "html", "templ" },
				root_markers = { ".git" },
			})
			vim.lsp.enable("html")
		end,
	},
}
