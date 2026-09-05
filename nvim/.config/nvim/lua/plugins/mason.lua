return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
			require("mason-nvim-dap").setup()
		end,
	},
}
