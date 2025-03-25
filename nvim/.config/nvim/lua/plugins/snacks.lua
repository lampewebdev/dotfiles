return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"neovim/nvim-lspconfig",
		},
		---@type snacks.Config
		opts = {
			statuscolumn = { enabled = true },
			animate = { enabled = true },
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			notifier = { enabled = false },
			quickfile = { enabled = true },
			image = { enabled = true },
			words = { enabled = true },
			picker = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			scope = { enabled = true },
		},
		keys = {
			-- explorer
			{
				"<leader>N",
				function()
					Snacks.explorer.open({ follow_file = true, hidden = true })
				end,
				desc = "Toggle Explorer",
			},
			-- buffers
			{
				"<leader><space>",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			-- files
			{
				"<leader>sf",
				function()
					Snacks.picker.smart({ hidden = true })
				end,
				desc = "Find Files",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep({ hidden = true })
				end,
				desc = "Grep",
			},
			{
				"<leader>sr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- git
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<leader>gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
		},
	},
	{
		"b0o/SchemaStore.nvim",
		lazy = true,
		version = false, -- last release is way too old
	},
}
