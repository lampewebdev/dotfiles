return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "work",
				path = "~/code/work/dib-obsidian/",
			},
		},

		templates = {
			subdir = "templates",
			date_format = "%a-%d-%m-%Y",
			time_format = "%H:%M",
		},
	},
}
