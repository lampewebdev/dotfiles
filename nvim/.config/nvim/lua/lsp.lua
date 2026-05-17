-- LSP configuration is now lazy-loaded via plugins/lsp/*.lua specs
-- Each LSP loads on its respective FileType

-- LSP Keymaps
local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
end

map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("K", vim.lsp.buf.hover, "Hover Documentation")
-- Note: gD defined in snacks.lua (Goto Declaration). Use gd for builtin definition.

-- Enable inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if vim.lsp.inlay_hint then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})

