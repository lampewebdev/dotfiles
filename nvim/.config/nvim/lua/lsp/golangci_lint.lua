local function golangci_lint()
	local constants = require("lsp.constants")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("golangci_lint_ls", {
		cmd = { mason_bin .. "golangci-lint-langserver" },
		filetypes = { "go", "gomod" },
		init_options = {
			command = {
				"golangci-lint",
				"run",
				"--output.text.path=",
				"--output.tab.path=",
				"--output.html.path=",
				"--output.checkstyle.path=",
				"--output.junit-xml.path=",
				"--output.teamcity.path=",
				"--output.sarif.path=",
				"--show-stats=false",
				"--output.json.path=stdout",
			},
		},
		root_markers = {
			".golangci.yml",
			".golangci.yaml",
			".golangci.toml",
			".golangci.json",
			"go.work",
			"go.mod",
		},
	})
	vim.lsp.enable("golangci_lint_ls")
end

return golangci_lint
