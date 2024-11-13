return {
	"yorumicolors/yorumi.nvim",
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
				-- colors = {
				-- 	palette = {
				-- 		sumiInk4 = "#16161d",
				-- 	},
				-- },
			})
			-- vim.cmd.colorscheme("kanagawa")
			vim.cmd.colorscheme("retrobox")
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		branch = "main",
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		setup = function()
			-- vim.o.background = "dark" -- or "light" for light mode
			-- vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},
	{
		"yashguptaz/calvera-dark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.calvera_italic_keywords = false
			vim.g.calvera_borders = true
			vim.g.calvera_contrast = true
			vim.g.calvera_hide_eob = true
			-- vim.g.calvera_custom_colors = {contrast = "#0f111a"}

			-- Required Setting
			-- require("calvera").set()
		end,
	},
	{
		"2nthony/vitesse.nvim",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
	},
	{
		"mellow-theme/mellow.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.mellow_italic_functions = true
			vim.g.mellow_bold_functions = true
			vim.g.mellow_italic_comments = true

			-- vim.cmd([[colorscheme mellow]])
		end,
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
	},
	-- {
	-- 	"eldritch-theme/eldritch.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("eldritch").setup({
	-- 			transparent = true,
	-- 			dim_inacative = true,
	-- 			styles = {
	-- 				comments = { italic = true },
	-- 				keywords = { italic = false },
	-- 				functions = { italic = true, bold = true },
	-- 				variables = {},
	-- 			},
	-- 		})
	-- 		-- vim.cmd.colorscheme("eldritch")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			wtyle = "moon",
	-- 			transparent = true,
	-- 			styles = {
	-- 				floats = "transparent",
	-- 				sidebars = "transparent",
	-- 			},
	-- 		})
	-- 		-- vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	-- {
	-- 	"xero/evangelion.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.cmd.colorscheme("evangelion")
	-- 	end,
	-- },
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
