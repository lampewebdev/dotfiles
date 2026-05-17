local function zls()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN
	vim.lsp.config("zls", {
		cmd = { mason_bin .. "zls" },
		filetypes = {
			"zig",
			"zir",
		},
		root_markers = {
			"zls.json",
			"build.zig",
			".git",
		},
		single_file_support = true,
	})

	vim.lsp.enable("zls")
end
return zls
