-- comment.lua
-- Easy code commenting
-- Usage:
--   gc + motion   = comment lines (e.g., gcip = comment inside paragraph)
--   gcc           = comment/uncomment current line
--   gc            = in visual mode, toggle comment on selection

return {
	{
		"numToStr/Comment.nvim",

		-- Load early so keymaps work right away
		-- Note: keys option handles lazy loading automatically
		keys = {
			{ "gc", mode = { "n", "v" }, desc = "Comment toggle (linewise)" },
			{ "gcc", mode = { "n", "v" }, desc = "Comment current line" },
		},

		opts = {
			-- Add extra keybindings (optional)
			mapping = {
				basic = true,
				extra = true,
			},
		},
	},
}