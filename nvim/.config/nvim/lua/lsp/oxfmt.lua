local function oxfmt()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("oxfmt", {
		cmd = { mason_bin .. "oxfmt" },
		filetypes = {
			"rust",
		},
		root_markers = {
			"Cargo.toml",
			"rust-project.json",
		},
	})
	vim.lsp.enable("oxfmt")
end

return oxfmt
