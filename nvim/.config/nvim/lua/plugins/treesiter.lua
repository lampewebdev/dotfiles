local parsers = {
	"bash",
	"css",
	"html",
	"javascript",
	"lua",
	"markdown",
	"markdown_inline",
	"scss",
	"svelte",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"vue",
}

local filetypes = {
	"bash",
	"css",
	"html",
	"javascript",
	"javascriptreact",
	"lua",
	"markdown",
	"scss",
	"svelte",
	"typescript",
	"typescriptreact",
	"vim",
	"vue",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({})
			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function(args)
					local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(args.buf))
					if not stat or stat.size <= 100 * 1024 then
						vim.treesitter.start(args.buf)
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
}
