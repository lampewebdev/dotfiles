-- snacks.lua
-- A collection of useful Neovim tools:
--   - File explorer
--   - Picker (find files, grep, buffers, etc.)
--   - Dashboard (start screen)
--   - Git integration
--   - And more!

return {
	{
		"folke/snacks.nvim",
		priority = 1000, -- Load early
		lazy = false,    -- Load at startup

		dependencies = {
			"nvim-tree/nvim-web-devicons", -- File icons
		},

		-- Enable/disable specific features
		opts = {
			-- UI improvements
			statuscolumn = { enabled = true }, -- Show git signs in column
			indent = { enabled = true },       -- Show indent guides
			bigfile = { enabled = true },      -- Handle large files better

			-- Disable features we don't need
			animate = { enabled = false },
			notifier = { enabled = false },
			quickfile = { enabled = false },
			image = { enabled = false },
			words = { enabled = false },
			picker = { enabled = true },
			scope = { enabled = false },

			-- Dashboard on startup
			dashboard = { enabled = true },

			-- File explorer settings
			explorer = {
				enabled = true,
				replace_netrw = true, -- Use snacks instead of netrw
				keys = {
					["ZZ"] = false, -- Disable to avoid conflicts
					["ZQ"] = false,
				},
			},
		},

		-- Keybindings (these lazy-load the plugin)
		keys = {
			-- File explorer: press Space + N
			{
				"<leader>N",
				function()
					if not vim.w.explorer_opening then
						vim.w.explorer_opening = true
						vim.defer_fn(function()
							vim.w.explorer_opening = false
						end, 100)
						Snacks.explorer.open({ follow_file = true, hidden = true })
					end
				end,
				desc = "Toggle Explorer",
			},

			-- Buffers: press Space + Space
			{
				"<leader><space>",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Show open buffers",
			},

			-- File search
			{
				"<leader>sf",
				function()
					Snacks.picker.smart({ hidden = true })
				end,
				desc = "Find Files",
			},

			-- Grep search
			{
				"<leader>sg",
				function()
					Snacks.picker.grep({ hidden = true })
				end,
				desc = "Grep in files",
			},

			-- Recent files
			{
				"<leader>sr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent Files",
			},

			-- Git branches
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Branches",
			},

			-- Git log
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},

			-- Git log for current line
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log (current line)",
			},

			-- Git status
			{
				"<leader>gst",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},

			-- Git stash
			{
				"<leader>gS",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},

			-- Git diff
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},

			-- Git log for file
			{
				"<leader>gF",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log (file)",
			},

			-- LSP: Go to definition
			{
				"gd",
				function()
					vim.lsp.buf_request_all(0, "textDocument/definition", function(client)
						return vim.lsp.util.make_position_params(0, client.offset_encoding)
					end, function(results)
						local locations = {}
						local offset_encoding = "utf-16"

						for client_id, response in pairs(results or {}) do
							if response and response.result then
								local client = vim.lsp.get_client_by_id(client_id)
								if client and client.offset_encoding then
									offset_encoding = client.offset_encoding
								end

								local result = response.result
								if vim.islist(result) then
									for _, location in ipairs(result) do
										table.insert(locations, location)
									end
								else
									table.insert(locations, result)
								end
							end
						end

						if #locations == 0 then
							return
						end

						local seen = {}
						local unique = {}
						for _, location in ipairs(locations) do
							local uri = location.uri or location.targetUri
							local range = location.range or location.targetSelectionRange
							if uri and range and range.start then
								local key = string.format("%s:%d:%d", uri, range.start.line, range.start.character)
								if not seen[key] then
									seen[key] = true
									table.insert(unique, location)
								end
							end
						end

						local target = unique[1] or locations[1]
						vim.lsp.util.show_document(target, offset_encoding, { focus = true })
					end)
				end,
				desc = "Go to Definition",
			},

			-- LSP: Go to declaration
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Go to Declaration",
			},

			-- LSP: Find references
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "Find References",
			},

			-- LSP: Go to implementation
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Go to Implementation",
			},

			-- LSP: Go to type definition
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Go to Type Definition",
			},

			-- LSP: Show symbols in buffer
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols (buffer)",
			},

			-- LSP: Show all symbols in workspace
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Symbols (workspace)",
			},
		},
	},
}