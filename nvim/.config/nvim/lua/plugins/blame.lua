return {
	{
		"FabijanZulj/blame.nvim",
		cmd = { "BlameToggle", "BlameShowVirtual", "BlameHideVirtual", "BlameShowCommit" },
		config = function()
			require("blame").setup({})
		end,
	},
}
