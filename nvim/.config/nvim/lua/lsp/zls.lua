local function zls()
	local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")
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
