return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			format_on_save = {
				timeout_ms = 500,
				-- lsp_format = "last",
			},
			formatters = {
				odinfmt = {
					-- Change where to find the command if it isn't in your path.
					command = "odinfmt",
					args = { "-stdin" },
					stdin = true,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome check" },
				typescript = { "biome" },
				javascriptreact = { "biome", "biome-check" },
				typescriptreact = { "biome", "biome-check" },
				html = { "biome", "biome-check" },
				htmlangular = { "biome", "biome-check" },
				templ = { "templ", "html", "htmx" },
				zig = { "zigfmt" },
				odin = { "odinfmt" },
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
