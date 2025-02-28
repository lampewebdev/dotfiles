local function tailwind()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

	vim.lsp.config("tailwind", {
		cmd = { mason_bin .. "tailwindcss-language-server" },
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
			"elixir",
			"eelixir",
			"heex",
			"eex",
		},
		init_options = {
			userLanguages = {
				templ = "html",
			},
		},
		settings = {
			experimental = {
				classRegex = {
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
		},
	})
	vim.lsp.enable("tailwind")
end
return tailwind
