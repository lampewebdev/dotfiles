-- Preact Language Server Configuration
-- Uses vtsls with Preact-specific settings (additional root markers and filetypes)
-- This is kept separate to allow project detection based on preact-specific files
local function preact()
	local constants = require("lsp.constants")
	local shared = require("lsp.shared")
	local mason_bin = constants.MASON_BIN

	-- Preact uses TypeScript, so we configure vtsls with Preact-specific options
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
			"typescript",
			"typescriptreact",
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
end

return preact
