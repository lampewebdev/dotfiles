-- Shared LSP configuration patterns
-- Extract common root_dir, capabilities, settings used across multiple LSP servers
local M = {}

function M.get_root_dir(bufnr, markers)
	return vim.fs.root(bufnr, markers) or vim.fn.getcwd()
end

-- Common capabilities
function M.make_client_capabilities()
	return vim.lsp.protocol.make_client_capabilities()
end

-- Common Lua LSP settings
M.lua_settings = {
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
}

-- Common TypeScript settings (vtsls, preact)
M.typescript_settings = {
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
}

-- Common CSS settings
M.css_settings = {
	css = {
		validate = true,
		lint = {
			compatibleVendorPrefixes = "warning",
			duplicateProperties = "warning",
			emptyRule = "warning",
			importStatement = "warning",
			unknownProperties = "error",
			validProperties = {},
		},
		format = {
			insertSpaces = true,
			tabSize = 2,
		},
		hover = {
			documentation = true,
			references = true,
		},
		validateOnTypescript = true,
	},
	scss = {
		validate = true,
		lint = {
			compatibleVendorPrefixes = "warning",
			duplicateProperties = "warning",
			emptyRule = "warning",
			importStatement = "warning",
			unknownProperties = "error",
		},
	},
	less = {
		validate = true,
	},
}

-- Common Tailwind CSS settings
M.tailwind_settings = {
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
}

-- Common Go settings
M.gopls_settings = {
	gopls = {
		completeUnimported = true,
		usePlaceholders = true,
		staticcheck = true,
		analyses = {
			unusedparams = true,
		},
	},
}

-- Common JSON settings
M.json_settings = {
	json = {
		format = {
			enable = true,
		},
		validate = { enable = true },
	},
}

return M
