return {
	{
		"mfussenegger/nvim-dap",
		ft = "go",
		dependencies = "leoluz/nvim-dap-go",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
}
