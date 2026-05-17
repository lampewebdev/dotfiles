-- Tailwind CSS LSP
return {
	{
		"neovim/nvim-lspconfig",
		ft = {
			"css",
			"scss",
			"html",
			"htmlangular",
			"templ",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		config = function()
			local constants = require("lsp.constants")
			local shared = require("lsp.shared")
			local mason_bin = constants.MASON_BIN

			vim.lsp.config("tailwind", {
				cmd = { mason_bin .. "tailwindcss-language-server", "--stdio" },
				filetypes = {
					"scss",
					"htmlangular",
					"css",
					"html",
					"templ",
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
					"svelte",
					"astro",
				},
				root_markers = {
					"tailwind.config.js",
					"tailwind.config.cjs",
					"tailwind.config.mjs",
					"tailwind.config.ts",
					"postcss.config.js",
					"postcss.config.cjs",
					"postcss.config.mjs",
					"postcss.config.ts",
				},
				settings = shared.tailwind_settings,
			})
			vim.lsp.enable("tailwind")
		end,
	},
}
