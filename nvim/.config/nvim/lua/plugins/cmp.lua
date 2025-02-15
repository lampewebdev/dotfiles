return {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "v0.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = { preset = "default" },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- optionally disable cmdline completions
				-- cmdline = {},
			},

			-- experimental signature help support
			signature = { enabled = true },
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},
	-- { -- Autocompletion
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		-- Snippet Engine & its associated nvim-cmp source
	-- 		{
	-- 			"L3MON4D3/LuaSnip",
	-- 			version = "v2.*",
	-- 			dependencies = { "rafamadriz/friendly-snippets" },
	-- 			build = (function()
	-- 				-- Build Step is needed for regex support in snippets
	-- 				-- This step is not supported in many windows environments
	-- 				-- Remove the below condition to re-enable on windows
	-- 				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
	-- 					return
	-- 				end
	-- 				return "make install_jsregexp"
	-- 			end)(),
	-- 		},
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		-- Adds other completion capabilities.
	-- 		--  nvim-cmp does not ship with all sources by default. They are split
	-- 		--  into multiple repos for maintenance purposes.
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-path",
	-- 		-- If you want to add a bunch of pre-configured snippets,
	-- 		--    you can use this plugin to help you. It even has snippets
	-- 		--    for various frameworks/libraries/etc. but you will have to
	-- 		--    set up the ones that are useful for you.
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- 	config = function()
	-- 		-- See `:help cmp`
	-- 		-- require("luasnip.loaders.from_vscode").lazy_load()
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 		local cmp = require("cmp")
	-- 		local luasnip = require("luasnip")
	-- 		luasnip.config.setup({})
	--
	-- 		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/my-snippets/" })
	--
	-- 		-- If you want to add Go-specific snippets
	-- 		-- luasnip.add_snippets("go", require("luasnip-snippets.go"))
	--
	-- 		cmp.setup({
	-- 			experimental = {
	-- 				ghost_text = true,
	-- 			},
	-- 			snippet = {
	-- 				expand = function(args)
	-- 					luasnip.lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			completion = { completeopt = "menu,menuone,noinsert" },
	--
	-- 			-- For an understanding of why these mappings were
	-- 			-- chosen, you will need to read `:help ins-completion`
	-- 			--
	-- 			-- No, but seriously. Please read `:help ins-completion`, it is really good!
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				-- Select the [n]ext item
	-- 				["<C-n>"] = cmp.mapping.select_next_item(),
	-- 				-- Select the [p]revious item
	-- 				["<C-p>"] = cmp.mapping.select_prev_item(),
	--
	-- 				-- Accept ([y]es) the completion.
	-- 				--  This will auto-import if your LSP supports it.
	-- 				--  This will expand snippets if the LSP sent a snippet.
	-- 				["<C-y>"] = cmp.mapping.confirm({ select = true }),
	--
	-- 				-- Manually trigger a completion from nvim-cmp.
	-- 				--  Generally you don't need this, because nvim-cmp will display
	-- 				--  completions whenever it has completion options available.
	-- 				["<C-k>"] = function()
	-- 					if cmp.visible() then
	-- 						cmp.abort()
	-- 					else
	-- 						cmp.complete()
	-- 					end
	-- 				end,
	-- 				-- Think of <c-l> as moving to the right of your snippet expansion.
	-- 				--  So if you have a snippet that's like:
	-- 				--  function $name($args)
	-- 				--    $body
	-- 				--  end
	-- 				--
	-- 				-- <c-l> will move you to the right of each of the expansion locations.
	-- 				-- <c-h> is similar, except moving you backwards.
	-- 				["<C-l>"] = cmp.mapping(function()
	-- 					if luasnip.expand_or_locally_jumpable() then
	-- 						luasnip.expand_or_jump()
	-- 					end
	-- 				end, { "i", "s" }),
	-- 				["<C-h>"] = cmp.mapping(function()
	-- 					if luasnip.locally_jumpable(-1) then
	-- 						luasnip.jump(-1)
	-- 					end
	-- 				end, { "i", "s" }),
	-- 			}),
	-- 			sources = {
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "luasnip" },
	-- 				{ name = "path" },
	-- 				{ name = "buffer" },
	-- 				{ naem = "tailwindcss" },
	-- 				{ name = "orgmode" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
