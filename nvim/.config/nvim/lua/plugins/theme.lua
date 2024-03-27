return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Load the colorscheme here
			-- vim.cmd.colorscheme("tokyonight-moon")
			-- You can configure highlights by doing something like
			-- vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				cmp = true,
				gitsigns = true,
				neotree = true,
				harpoon = true,
				treesitter = true,
				treesitter_context = true,
				notify = true,
				mini = {
					enabled = true,
					indentscope_color = "lavender",
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
