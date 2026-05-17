-- Biome (linter/formatter for JS/TS/JSON)
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
		config = function()
			local constants = require("lsp.constants")
			local mason_bin = constants.MASON_BIN

			vim.lsp.config("biome", {
				cmd = { mason_bin .. "biome", "lsp-proxy" },
				filetypes = {
					"javascript",
					"javascriptreact",
					"json",
					"jsonc",
					"typescript",
					"typescriptreact",
				},
				root_markers = { "biome.json", "biome.jsonc" },
			})
			vim.lsp.enable("biome")
		end,
	},
}
