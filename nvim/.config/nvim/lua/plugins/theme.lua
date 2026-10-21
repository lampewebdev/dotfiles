return {
	-- Code Villain, from the vault: code/apps/theme/nvim. A dark background is
	-- night, a light one day. Was folke/tokyonight.nvim (tokyonight-night).
	{
		dir = "~/code/villain/villain-vault/code/apps/theme/nvim",
		name = "code-villain",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("code-villain")
		end,
	},
}
