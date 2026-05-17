local function jsonls()
	local constants = require("lsp.constants")
	local shared = require("lsp.shared")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("jsonls", {
		cmd = { mason_bin .. "vscode-json-language-server", "--stdio" },
		filetypes = { "json", "jsonc" },
		init_options = {
			provideFormatter = true,
		},
		single_file_support = true,
		settings = shared.json_settings,
	})

	vim.lsp.enable("jsonls")
end

return jsonls
