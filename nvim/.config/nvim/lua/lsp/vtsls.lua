local function vtsls()
	local constants = require("lsp.constants")
	local shared = require("lsp.shared")
	local mason_bin = constants.MASON_BIN

	vim.lsp.config("vtsls", {
		cmd = { mason_bin .. "vtsls", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		root_dir = function(bufnr, on_dir)
			local root_markers = {
				{ "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
				{ ".git" },
			}
			local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc", "deno.lock" })
			local project_root = vim.fs.root(bufnr, root_markers)

			if deno_root and (not project_root or #deno_root >= #project_root) then
				return
			end

			on_dir(project_root or vim.fn.getcwd())
		end,
		settings = shared.typescript_settings,
	})
	vim.lsp.enable("vtsls")
end
return vtsls
