require("lsp/angularls")()
require("lsp/luals")()
require("lsp/eslint")()
require("lsp/vtsls")()
require("lsp/tailwind")()
require("lsp/html")()
require("lsp/htmx")()
require("lsp/prettierd")()
require("lsp/gopls")()
require("lsp/jsonls")()
require("lsp/zls")()

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end

map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("K", vim.lsp.buf.hover, "Hover Documentation")
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
