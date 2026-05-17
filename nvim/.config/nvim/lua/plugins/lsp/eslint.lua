-- ESLint LSP
return {
	{
		"neovim/nvim-lspconfig",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function()
			local constants = require("lsp.constants")
			local mason_bin = constants.MASON_BIN

			local function get_root_dir(bufnr)
				local match = vim.fs.root(bufnr, {
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json",
					"eslint.config.js",
					"eslint.config.mjs",
					"eslint.config.cjs",
					"eslint.config.ts",
					"eslint.config.mts",
					"eslint.config.cts",
					"package.json",
				})
				return match or vim.fn.getcwd()
			end

			local function has_eslint_config(bufnr)
				return get_root_dir(bufnr) ~= nil
			end

			vim.lsp.config("eslint", {
				cmd = { mason_bin .. "vscode-eslint-language-server", "--stdio" },
				filetypes = { "htmlangular", "html", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
				root_dir = get_root_dir,
				settings = {
					nodePath = "",
					experimental = { useFlatConfig = true },
				},
				on_init = function(client)
					if not has_eslint_config(0) then
						vim.schedule(function()
							vim.notify("[eslint] No config file found - LSP may not work correctly", vim.log.levels.WARN)
						end)
					end
				end,
			})
			vim.lsp.enable("eslint")
		end,
	},
}
