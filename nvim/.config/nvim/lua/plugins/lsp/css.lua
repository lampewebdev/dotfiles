-- CSS LSP
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "css", "scss", "less", "postcss" },
		config = function()
			local constants = require("lsp.constants")
			local shared = require("lsp.shared")
			local mason_bin = constants.MASON_BIN

			vim.lsp.config("css", {
				cmd = { mason_bin .. "vscode-css-language-server", "--stdio" },
				filetypes = { "css", "scss", "less", "postcss" },
				root_markers = { ".git", "package.json" },
				settings = shared.css_settings,
			})
			vim.lsp.enable("css")
		end,
	},
}
