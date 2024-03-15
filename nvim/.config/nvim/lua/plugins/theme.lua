return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Load the colorscheme here
			vim.cmd.colorscheme("tokyonight-moon")
			vim.cmd.colorscheme("catppuccin-mocha")

			-- You can configure highlights by doing something like
			vim.cmd.hi("Comment gui=none")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
}
