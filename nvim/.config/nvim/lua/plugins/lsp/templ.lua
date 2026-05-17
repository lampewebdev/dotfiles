-- Templ LSP
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "templ" },
		config = function()
			local constants = require("lsp.constants")
			local mason_bin = constants.MASON_BIN

			vim.lsp.config("templ", {
				cmd = { mason_bin .. "templ", "lsp" },
				filetypes = { "templ" },
				root_markers = { ".git" },
			})
			vim.lsp.enable("templ")
		end,
	},
}
