vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.conceallevel = 0

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cmdheight = 0
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.showmode = false

vim.o.winborder = "rounded"
vim.opt.number = true

vim.opt.undofile = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.hlsearch = true

vim.diagnostic.config({
	-- Use the default configuration
	-- virtual_text = true,
	-- virtual_lines = true,

	-- Alternatively, customize specific options
	virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
		current_line = true,
	},
})
