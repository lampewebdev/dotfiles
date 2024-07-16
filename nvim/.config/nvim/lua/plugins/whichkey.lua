return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VeryLazy", -- Sets the loading event to 'VimEnter'
		opts = {
			preset = "modern",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		-- init = function()
		-- 	vim.o.timeout = true
		-- 	vim.o.timeoutlen = 0
		-- end,
		-- config = function() -- This is the function that runs, AFTER loading
		-- 	require("which-key").setup()
		--
		-- 	-- Document existing key chains
		-- 	require("which-key").register({
		-- 		["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
		-- 		["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		-- 		["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		-- 		["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		-- 		["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		-- 	})
		-- end,
	},
}
