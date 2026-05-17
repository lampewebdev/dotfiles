local function gopls()
	local constants = require("lsp.constants")
	local shared = require("lsp.shared")
	local mason_bin = constants.MASON_BIN

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
		settings = shared.gopls_settings,
	})

	vim.lsp.enable("gopls")
end
return gopls
