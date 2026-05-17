return {
	{
		"brenoprata10/nvim-highlight-colors",
		ft = { "css", "scss", "less", "html", "javascript", "typescript" },
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
}
