-- LSP servers registered eagerly per-language via lsp/*.lua modules
require("lsp.vtsls")()
require("lsp.gopls")()
require("lsp.golangci_lint")()
require("lsp.luals")()
require("lsp.html")()
require("lsp.jsonls")()
require("lsp.biome")()
require("lsp.oxlint")()
require("lsp.bash")()

-- LSP Keymaps
local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end

map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("K", vim.lsp.buf.hover, "Hover Documentation")
-- Note: gD defined in snacks.lua (Goto Declaration). Use gd for builtin definition.

-- Disable inlay hints by default
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if vim.lsp.inlay_hint then
			vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
		end
	end,
})
