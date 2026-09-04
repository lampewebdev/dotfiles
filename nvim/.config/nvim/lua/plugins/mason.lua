return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				npm = {
					install_args = { "--force" },
				},
			})
			require("mason-nvim-dap").setup()
		end,
	},
}
