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
					"vim",
					"vimdoc",
					"typescript",
				},
				auto_install = false,
				sync_install = false,
				highlight = { 
					enable = true,
					disable = function(lang, buf)
						-- Disable highlighting for markdown files due to Tree-sitter issues
						if lang == "markdown" or lang == "markdown_inline" then
							return true
						end
						-- Disable highlighting for very large files
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				indent = { 
					enable = true,
					disable = function(lang)
						-- Also disable indent for markdown
						if lang == "markdown" or lang == "markdown_inline" then
							return true
						end
					end,
				},
			})
			
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
				pattern = { "*.component.html", "*.container.html" },
				callback = function()
					vim.treesitter.start(nil, "angular")
				end,
			})
			
			-- Prevent Tree-sitter from starting on markdown files
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function(args)
					-- Disable tree-sitter for this buffer
					pcall(function()
						vim.treesitter.stop(args.buf)
						vim.bo[args.buf].syntax = "markdown"
					end)
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
