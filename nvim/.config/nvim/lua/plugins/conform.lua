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

			local function get_web_formatter(bufnr)
				local buf_name = vim.api.nvim_buf_get_name(bufnr)
				if buf_name == "" then
					return { "oxfmt" }
				end

				local dir = vim.fs.dirname(buf_name)

				if vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true, path = dir, stop = vim.env.HOME })[1] then
					return { "biome" }
				end

				return { "oxfmt" }
			end

			return {
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters = {
					oxfmt = {
						command = constants.MASON_BIN .. "oxfmt",
						args = { "--stdin-filepath", "$FILENAME" },
						stdin = true,
					},
					biome = {
						command = constants.MASON_BIN .. "biome",
						args = { "format", "--stdin-file-path", "$FILENAME" },
						stdin = true,
					},
				},
				formatters_by_ft = {
					javascript = get_web_formatter,
					javascriptreact = get_web_formatter,
					typescript = get_web_formatter,
					typescriptreact = get_web_formatter,
					json = get_web_formatter,
					jsonc = get_web_formatter,
					html = get_web_formatter,
					htmlangular = get_web_formatter,
					lua = { "stylua" },
				},
			}
		end,
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
