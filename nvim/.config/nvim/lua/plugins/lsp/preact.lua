-- Preact LSP (extends vtsls)
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "preact" },
		config = function()
			local constants = require("lsp.constants")
			local shared = require("lsp.shared")
			local mason_bin = constants.MASON_BIN

			local preact_settings = vim.tbl_deep_extend("force", shared.typescript_settings, {
				typescript = vim.tbl_deep_extend("force", shared.typescript_settings.typescript, {
					preferences = {
						includePackageJsonAutoImports = "on",
						includeCompletionsForModuleExports = true,
					},
				}),
				javascript = {
					preferences = {
						includePackageJsonAutoImports = "on",
						includeCompletionsForModuleExports = true,
					},
				},
			})

			vim.lsp.config("preact", {
				cmd = { mason_bin .. "vtsls", "--stdio" },
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"preact",
				},
				root_markers = {
					"tsconfig.json",
					"tsconfig.preact.json",
					"preact.config.js",
					"preact.config.ts",
					"preact.config.mjs",
					"package.json",
				},
				settings = preact_settings,
			})
			vim.lsp.enable("preact")
		end,
	},
}
