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

-- Wrap the Tree-sitter start function to prevent markdown from being parsed
local orig_start = vim.treesitter.start
vim.treesitter.start = function(bufnr, lang)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	lang = lang or vim.bo[bufnr].filetype
	
	-- Block markdown and markdown_inline from being parsed
	if lang == "markdown" or lang == "markdown_inline" then
		return
	end
	
	return orig_start(bufnr, lang)
end

-- Also wrap get_parser to prevent markdown parsing at a lower level
local orig_get_parser = vim.treesitter.get_parser
vim.treesitter.get_parser = function(bufnr, lang, ...)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	lang = lang or vim.bo[bufnr].filetype
	
	-- Block markdown and markdown_inline from being parsed
	if lang == "markdown" or lang == "markdown_inline" then
		error("Tree-sitter parsing is disabled for markdown files", 0)
	end
	
	return orig_get_parser(bufnr, lang, ...)
end
