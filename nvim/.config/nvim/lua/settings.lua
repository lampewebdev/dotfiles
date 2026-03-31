vim.g.have_nerd_font = true

-- System clipboard integration for macOS
vim.g.clipboard = {
	name = "macOS-clipboard",
	copy = { "+", "pbcopy" },
	paste = { "+", "pbpaste" },
}

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

-- Preact filetype detection
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = { "*.preact.*", "preact.config.*" },
	callback = function(args)
		local filename = vim.fn.fnamemodify(args.file, ":t")
		if filename:match("%.preact%.") then
			vim.bo.filetype = filename:match("tsx$") and "typescriptreact" or "javascript"
		elseif filename:match("^preact%.") then
			vim.bo.filetype = filename:match("%.m?js$") and "javascript" or "typescript"
		end
	end,
})

-- CSS Modules detection (*.module.css, *.module.scss)
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = { "*.module.css", "*.module.scss", "*.module.sass" },
	callback = function()
		vim.bo.filetype = vim.fn.expand("%:t:r"):match("%.module$") 
			and (vim.fn.expand("%:e") == "scss" and "scss" or "css")
			or vim.bo.filetype
	end,
})
