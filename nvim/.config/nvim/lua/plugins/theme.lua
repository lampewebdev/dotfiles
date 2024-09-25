return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				commentStyle = { italic = true },
				functionStyle = { italic = true },
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = { italic = true },
				transparent = true,
				colors = {
					palette = {
						sumiInk4 = "#16161d",
					},
				},
			})
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				wtyle = "moon",
				transparent = true,
				styles = {
					floats = "transparent",
					sidebars = "transparent",
				},
			})
			-- vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"xero/evangelion.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("evangelion")
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			transparent_background = true,
	-- 			cmp = true,
	-- 			gitsigns = true,
	-- 			neotree = true,
	-- 			harpoon = true,
	-- 			treesitter = true,
	-- 			treesitter_context = true,
	-- 			notify = true,
	-- 			mini = {
	-- 				enabled = true,
	-- 				indentscope_color = "lavender",
	-- 			},
	-- 			native_lsp = {
	-- 				enabled = true,
	-- 				virtual_text = {
	-- 					errors = { "italic" },
	-- 					hints = { "italic" },
	-- 					warnings = { "italic" },
	-- 					information = { "italic" },
	-- 				},
	-- 				underlines = {
	-- 					errors = { "underline" },
	-- 					hints = { "underline" },
	-- 					warnings = { "underline" },
	-- 					information = { "underline" },
	-- 				},
	-- 				inlay_hints = {
	-- 					background = true,
	-- 				},
	-- 			},
	-- 		})
	-- 		-- vim.cmd.colorscheme("catppuccin-mocha")
	-- 	end,
	-- },
}
