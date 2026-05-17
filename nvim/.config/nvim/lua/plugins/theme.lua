return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		event = "VimEnter",
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
