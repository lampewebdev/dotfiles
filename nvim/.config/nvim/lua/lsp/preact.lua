-- Preact Language Server Configuration
-- Uses vtsls with Preact-specific settings

local function preact()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

	-- Preact uses TypeScript, so we configure vtsls with Preact-specific options
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
		settings = {
			complete_function_calls = true,
			vtsls = {
				enableMoveToFileCodeAction = true,
				autoUseWorkspaceTsdk = true,
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
				preferences = {
					includePackageJsonAutoImports = "on",
					includeCompletionsForModuleExports = true,
				},
			},
			javascript = {
				preferences = {
					includePackageJsonAutoImports = "on",
					includeCompletionsForModuleExports = true,
				},
			},
		},
	})
	vim.lsp.enable("preact")
end

return preact
