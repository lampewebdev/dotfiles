return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				javascript = { "eslint", "prettierd", "prettier", stop_after_first = true },
				typescript = { "eslint", "prettierd", "prettier", stop_after_first = true },
				html = { "eslint", "prettierd", "prettier", stop_after_first = true },
				htmlangular = { "eslint", "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
