return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"angular",
					"bash",
					"html",
					"lua",
					"markdown",
					"vim",
					"vimdoc",
					"typescript",
				},
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
			-- if type(opts.ensure_installed) == "table" then
			-- 	vim.list_extend(opts.ensure_installed, { "angular", "scss" })
			-- end
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
				pattern = { "*.component.html", "*.container.html" },
				callback = function()
					vim.treesitter.start(nil, "angular")
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
		end,
	},
}
