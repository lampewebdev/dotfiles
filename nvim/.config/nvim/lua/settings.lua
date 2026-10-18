vim.g.have_nerd_font = true

vim.opt.clipboard = "unnamedplus"
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

-- Let Neovim's filesystem watchers reload files changed by external tools.
vim.o.autoread = true

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
		local filename = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
		if filename:match("%.module%.") then
			local ext = vim.fn.expand("%:e")
			vim.bo.filetype = ext == "scss" and "scss" or "css"
		end
	end,
})

-- Snacks explorer: ensure ZQ/ZZ work in explorer buffer
-- Use BufEnter to catch explorer window when it opens
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		-- Check if this is snacks explorer by checking buffer name
		if vim.fn.bufname(args.buf):match("snacks") or vim.bo.filetype:match("snacks") then
			-- Use proper ex-command format to avoid register parsing
			vim.keymap.set("n", "ZQ", function()
				vim.cmd("qa!")
			end, { buf = args.buf, noremap = true })
			vim.keymap.set("n", "ZZ", function()
				vim.cmd("wq")
			end, { buf = args.buf, noremap = true })
		end
	end,
})
