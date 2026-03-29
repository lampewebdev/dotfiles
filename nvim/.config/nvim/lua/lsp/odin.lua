local function ols()
	local mason_bin = vim.fn.expand("~/.local/share/nvim/mason/bin/ols")
	local cellar_root = "/opt/homebrew/Cellar/odin/2026-03/libexec"

	-- Ensure we have the full diagnostic capabilities set
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	vim.lsp.config("ols", {
		cmd = { mason_bin },
		capabilities = capabilities,
		root_dir = vim.fs.root(0, { "ols.json", ".git" }),
		init_options = {
			enable_diagnostics = true,
			checker_args = "-strict-style",
			odin_path = cellar_root,
			collections = {
				{ name = "core", path = cellar_root .. "/core" },
				{ name = "vendor", path = cellar_root .. "/vendor" },
			},
		},
		filetypes = { "odin" },
	})

	vim.lsp.enable("ols")
end

return ols
