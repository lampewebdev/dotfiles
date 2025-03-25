local function tailwind()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

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
		settings = {
			tailwindCSS = {
				validate = true,
				lint = {
					cssConflict = "warning",
					invalidApply = "error",
					invalidScreen = "error",
					invalidVariant = "error",
					invalidConfigPath = "error",
					invalidTailwindDirective = "error",
					recommendedVariantOrder = "warning",
				},
				classAttributes = {
					"class",
					"className",
					"class:list",
					"classList",
					"ngClass",
				},
				includeLanguages = {
					eelixir = "html-eex",
					eruby = "erb",
					templ = "html",
					htmlangular = "html",
				},
				experimental = {
					classRegex = {
						{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
						{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					},
				},
			},
		},
	})
	vim.lsp.enable("tailwind")
end
return tailwind
