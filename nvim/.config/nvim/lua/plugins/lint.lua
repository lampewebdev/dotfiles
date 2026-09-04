return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")
			local constants = require("lsp.constants")

			lint.linters.oxlint.cmd = constants.MASON_BIN .. "oxlint"
			lint.linters_by_ft = {
				javascript = { "oxlint" },
				javascriptreact = { "oxlint" },
				typescript = { "oxlint" },
				typescriptreact = { "oxlint" },
			}

			local group = vim.api.nvim_create_augroup("nvim-lint-oxlint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = group,
				callback = function()
					if lint.linters_by_ft[vim.bo.filetype] then
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
