-- Load centralized LSP configuration
require("lsp.config")

-- Keep Angular LS setup (requires special handling)
require("lsp/angularls")()

-- LSP Keymaps
local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end

map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("K", vim.lsp.buf.hover, "Hover Documentation")
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

-- Enable inlay hints
vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

