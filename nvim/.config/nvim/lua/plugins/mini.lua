return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			local statusline = require("mini.statusline")
			statusline.setup()
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return ""
			end
			require("mini.comment").setup()
			require("mini.starter").setup()
		end,
	},
}
