return {
	{
		"mattn/emmet-vim",
		lazy = false,
		config = function()
			vim.g.user_emmet_leader_key = "<C-y>"
			vim.g.user_emmet_settings = {
				javascript = {
					extends = "tsx",
				},
				typescript = {
					extends = "tsx",
				},
				typescriptreact = {
					extends = "html",
				},
				javascriptreact = {
					extends = "html",
				},
				html = {
					attributes = {
						["class"] = "class",
						["className"] = "class",
					},
				},
			}
		end,
	},
}
