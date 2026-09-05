local function bash()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("bashls", {
		cmd = { mason_bin .. "bash-language-server", "start" },
		filetypes = { "sh", "bash" },
		root_markers = { ".git", ".bashrc", ".bash_profile" },
	})
	vim.lsp.enable("bashls")
end

return bash
