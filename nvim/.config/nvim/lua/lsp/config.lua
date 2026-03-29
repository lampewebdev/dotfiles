-- Centralized LSP configuration using vim.lsp.config (Neovim 0.11+)
-- This replaces individual vim.lsp.config() calls scattered across multiple files

local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

-- Helper to get root directory
local function get_root(bufnr, markers)
	return vim.fs.root(bufnr, markers) or vim.fn.getcwd()
end

-- Lua Language Server
vim.lsp.config("luals", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "vim", "require" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("luals")

-- TypeScript/JavaScript (vtsls)
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
	root_markers = { "tsconfig.json" },
	settings = {
		complete_function_calls = true,
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				maxInlayHintLength = 30,
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = { completeFunctionCalls = true },
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = true },
			},
		},
	},
})
vim.lsp.enable("vtsls")

-- Biome (linter/formatter)
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

-- HTML Language Server
vim.lsp.config("html", {
	cmd = { mason_bin .. "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	root_markers = { ".git" },
})
vim.lsp.enable("html")

-- HTMX Language Server
vim.lsp.config("htmx", {
	cmd = { mason_bin .. "htmx-lsp" },
	filetypes = { "html", "htmlangular", "templ" },
	root_markers = { ".git" },
})
vim.lsp.enable("htmx")

-- JSON Language Server
vim.lsp.config("jsonls", {
	cmd = { mason_bin .. "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { ".git" },
})
vim.lsp.enable("jsonls")

-- Tailwind CSS Language Server
vim.lsp.config("tailwind", {
	cmd = { mason_bin .. "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-js",
		"astro-jsx",
		"astro-ts",
		"astro-tsx",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir",
		"elixir",
		" eruby",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
	},
})
vim.lsp.enable("tailwind")

-- Go Language Server
vim.lsp.config("gopls", {
	cmd = { mason_bin .. "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", ".git" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})
vim.lsp.enable("gopls")

-- Zig Language Server
vim.lsp.config("zls", {
	cmd = { mason_bin .. "zls" },
	filetypes = { "zig", "zir" },
	root_markers = { "build.zig" },
})
vim.lsp.enable("zls")

-- Odin Language Server
vim.lsp.config("ols", {
	cmd = { mason_bin .. "ols" },
	filetypes = { "odin" },
	root_markers = { "ols.json" },
})
vim.lsp.enable("ols")

-- Templ Language Server
vim.lsp.config("templ", {
	cmd = { mason_bin .. "templ", "lsp" },
	filetypes = { "templ" },
	root_markers = { ".git" },
})
vim.lsp.enable("templ")

-- ESLint Language Server
vim.lsp.config("eslint", {
	cmd = { mason_bin .. "vscode-eslint-language-server", "--stdio" },
	filetypes = {
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
	},
})
vim.lsp.enable("eslint")

-- Note: Angular Language Server is handled specially with autocmd in angularls.lua
-- as it requires complex path setup and root detection
