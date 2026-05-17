-- Lua LSP (luals)
return {
	{
		"neovim/nvim-lspconfig",
		ft = "lua",
		config = function()
			local shared = require("lsp.shared")
			vim.lsp.config("luals", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc" },
				settings = shared.lua_settings,
			})
			vim.lsp.enable("luals")
		end,
	},
}
