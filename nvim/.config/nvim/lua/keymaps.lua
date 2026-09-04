-- ============================================================
-- KEYMAPS: Keyboard shortcuts for Neovim
-- ============================================================
-- Syntax: vim.keymap.set(mode, key, action, options)
--   mode: "n" = normal, "i" = insert, "v" = visual
--   key: the key(s) to press
--   action: what happens (command, function, or string)
--   options: optional settings like { desc = "description" }
-- ============================================================

-- ESC to clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Quit shortcuts (work even in file explorer)
vim.keymap.set("n", "ZQ", "<cmd>qa!<CR>", { noremap = true, desc = "Quit all without saving" })
vim.keymap.set("n", "ZZ", "<cmd>wq<CR>", { noremap = true, desc = "Write and quit" })

-- ============================================================
-- DIAGNOSTICS: navigate between error/warning messages
-- ============================================================
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open quickfix list" })

-- ============================================================
-- CLIPBOARD: copy/paste to system clipboard (macOS)
-- Uses + register
-- ============================================================
-- Yank/paste via + register so motions like <leader>yiw work
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste before cursor" })

-- ============================================================
-- MOVE LINES: move selected lines up/down in visual mode
-- ============================================================
vim.keymap.set("v", "<C-j>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '>+1<CR>gv=gv")

-- ============================================================
-- ANGULAR: Angular framework shortcuts
-- ============================================================
-- Jump between Angular component files (template, styles, etc.)
vim.keymap.set("n", "<leader>agc", function()
	local filename = vim.fn.expand("%:t:r")
	local component_name = filename:gsub("%..*$", "")
	local html_file = vim.fn.findfile(component_name .. ".component.html", ".;")
	if html_file ~= "" then
		vim.cmd("edit " .. html_file)
	else
		vim.cmd("edit %:h/" .. component_name .. ".component.html")
	end
end, { desc = "Angular: Go to component template" })

vim.keymap.set("n", "<leader>agt", function()
	local filename = vim.fn.expand("%:t:r")
	local component_name = filename:gsub("%..*$", "")
	vim.cmd("edit %:h/" .. component_name .. ".component.html")
end, { desc = "Angular: Go to template" })

vim.keymap.set("n", "<leader>ags", function()
	local filename = vim.fn.expand("%:t:r")
	local component_name = filename:gsub("%..*$", "")
	local ext = vim.fn.expand("%:e")
	local style_file = vim.fn.findfile(
		"%:h/" .. component_name .. ".component." .. (ext == "ts" and "scss" or "css"),
		".;"
	)
	if style_file ~= "" then
		vim.cmd("edit " .. style_file)
	end
end, { desc = "Angular: Go to styles" })

vim.keymap.set("n", "<leader>agf", function()
	local filename = vim.fn.expand("%:t:r")
	local base_name = filename:gsub("%..*$", "")
	local files = vim.fn.readdir(vim.fn.expand("%:h"), function(name)
		return name:match("^" .. base_name .. "%.")
	end)
	if #files > 0 then
		vim.cmd("edit " .. vim.fn.expand("%:h") .. "/" .. files[1])
	end
end, { desc = "Angular: Find related files" })

vim.keymap.set("n", "<leader>ec", function()
	vim.lsp.buf.code_action({ context = { only = { "refactor.extract.ts" } } })
end, { desc = "Angular: Extract to component" })

vim.keymap.set("n", "<leader>agss", function()
	vim.lsp.buf.document_symbol()
end, { desc = "Angular: Show structure" })

-- ============================================================
-- TYPESCRIPT: JavaScript/TypeScript shortcuts
-- ============================================================
vim.keymap.set("n", "<leader>ft", function()
	local current = vim.fn.expand("%:p")
	local test_patterns = {
		"%.spec.ts$",
		"%.test.ts$",
		"%.spec.js$",
		"%.test.js$",
		"%.spec.tsx$",
		"%.test.tsx$",
		"%.spec.jsx$",
		"%.test.jsx$",
	}
	local is_test = false
	for _, pattern in ipairs(test_patterns) do
		if current:match(pattern) then
			is_test = true
			break
		end
	end
	local replacement = is_test and "" or ".spec"
	local new_file = current:gsub("%.ts", replacement .. ".ts"):gsub("%.js", replacement .. ".js"):gsub("%.tsx", replacement .. ".tsx"):gsub("%.jsx", replacement .. ".jsx")
	if vim.fn.filereadable(new_file) == 1 then
		vim.cmd("edit " .. new_file)
	else
		vim.cmd("edit " .. vim.fn.fnamemodify(current, ":r") .. ".spec" .. vim.fn.fnamemodify(current, ":e"))
	end
end, { desc = "Toggle test file" })

vim.keymap.set("n", "<leader>fr", function()
	local current_file = vim.fn.expand("%:p")
	local new_file = vim.fn.input("New file name: ", vim.fn.expand("%:p:h") .. "/", "file")
	if new_file ~= "" then
		vim.cmd("saveas " .. new_file)
		vim.cmd("edit " .. current_file)
		vim.cmd("bdelete! " .. new_file)
	end
end, { desc = "Rename file" })

vim.keymap.set("n", "<leader>fi", function()
	vim.lsp.buf.implementation()
end, { desc = "Find implementations" })

vim.keymap.set("n", "<leader>fo", function()
	Snacks.picker.symbols()
end, { desc = "File outline" })

vim.keymap.set("n", "<leader>fu", function()
	vim.lsp.buf.code_action({ context = { only = { "quickfix" } } })
end, { desc = "Find unused imports" })