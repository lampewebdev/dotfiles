return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.config").setup({
			ensure_installed = {
				"bash",
					"html",
					"lua",
					"vim",
					"vimdoc",
					"typescript",
					"tsx",
					"css",
					"scss",
					"markdown",
					"markdown_inline",
				},
				auto_install = false,
				sync_install = false,
				highlight = { 
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				indent = { 
					enable = true,
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
	lazy = true,
	ft = { "html", "javascript", "typescriptreact", "tsx", "svelte", "vue" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
}
