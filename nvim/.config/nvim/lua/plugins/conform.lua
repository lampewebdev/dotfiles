return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufNewFile" },
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
		opts = function()
			local constants = require("lsp.constants")
			return {
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "first",
				},
				formatters = {
					odinfmt = {
						command = "odinfmt",
						args = { "-stdin" },
						stdin = true,
					},
					biome = {
						command = constants.MASON_BIN .. "biome",
						args = { "format", "--stdin-file-path", "$FILENAME" },
						stdin = true,
					},
				},
				formatters_by_ft = {
					json = { "biome" },
					jsonc = { "biome" },
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
			}
		end,
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
