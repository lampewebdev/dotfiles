-- which-key.lua
-- Shows a popup menu when you press a leader key
-- Allows you to see all available keybindings starting with Space

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",

		opts = {
			preset = "modern",
			triggers = { "<leader>" },
		},
	},
}