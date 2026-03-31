-- Load centralized LSP configuration
require("lsp.config")

-- Load language-specific LSP configurations
require("lsp/angularls")()
require("lsp/preact")()

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
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if vim.lsp.inlay_hint then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})

