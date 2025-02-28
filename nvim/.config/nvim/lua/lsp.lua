local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

vim.lsp.config("luals", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
})
vim.lsp.enable("luals")

vim.lsp.config("eslint", {
	cmd = { mason_bin .. "vscode-eslint-language-server", "--stdio" },
	settings = {
		nodePath = "",
		experimental = {
			useFlatConfig = true,
		},
	},
	filetypes = {
		"htmlangular",
		"html",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = {
		".eslintrc",
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
		".eslintrc.json",
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
		"eslint.config.ts",
		"eslint.config.mts",
		"eslint.config.cts",
	},
})
vim.lsp.enable("eslint")

vim.lsp.config("vtsls", {
	cmd = { mason_bin .. "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = {
		"tsconfig.json",
	},
})
vim.lsp.enable("vtsls")

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

vim.lsp.config("prettierd", {
	cmd = { mason_bin .. "prettierd" },
	filetypes = {
		"htmlangular",
		"scss",
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
	},
})
vim.lsp.enable("prettierd")

vim.lsp.config("html", {
	cmd = { mason_bin .. "vscode-html-language-server", "--stdio" },
	filetypes = {
		"htmlangular",
		"html",
		"templ",
	},
})
vim.lsp.enable("html")

vim.lsp.config("htmx", {
	cmd = { mason_bin .. "htmx-lsp" },
	filetypes = {
		"html",
		"templ",
	},
	root_markers = {
		"go.mod",
	},
})
vim.lsp.enable("htmx")

vim.lsp.config("templ", {
	cmd = { mason_bin .. "templ", "lsp" },
	filetypes = {
		"templ",
	},
})
vim.lsp.enable("templ")

vim.lsp.config("gopls", {
	cmd = { mason_bin .. "gopls" },
	filetypes = {
		"go",
		"gomod",
		"gowork",
		"gotmpl",
	},
	root_markers = {
		"go.mod",
	},
})

vim.lsp.enable("gopls")
local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end

map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("K", vim.lsp.buf.hover, "Hover Documentation")
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
