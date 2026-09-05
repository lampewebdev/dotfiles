local function luals()
	local shared = require("lsp.shared")
	local constants = require("lsp.constants")

	vim.lsp.config("luals", {
		cmd = { constants.MASON_BIN .. "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".luarc.json", ".luarc.jsonc" },
		settings = shared.lua_settings,
	})
	vim.lsp.enable("luals")
end
return luals
