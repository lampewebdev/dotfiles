-- Bash LSP
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "sh", "bash" },
		config = function()
			local constants = require("lsp.constants")
			local mason_bin = constants.MASON_BIN

			vim.lsp.config("bash-language-server", {
				cmd = { mason_bin .. "bash-language-server", "start" },
				filetypes = { "sh", "bash" },
				root_markers = { ".git", ".bashrc", ".bash_profile" },
			})
			vim.lsp.enable("bash-language-server")
		end,
	},
}
