local function templ()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("templ", {
		cmd = { mason_bin .. "templ", "lsp" },
		filetypes = {
			"templ",
		},
	})
	vim.lsp.enable("templ")
end
return templ
