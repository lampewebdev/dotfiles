vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before cursor from system clipboard" })

vim.keymap.set("v", "<C-j>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '>+1<CR>gv=gv")

-- Angular-specific keybindings
vim.keymap.set("n", "<leader>gc", function()
	local filename = vim.fn.expand("%:t:r")
	local component_name = filename:gsub("%..*$", "")
	local html_file = vim.fn.findfile(component_name .. ".component.html", ".;")
	if html_file ~= "" then
		vim.cmd("edit " .. html_file)
	else
		vim.cmd("edit %:h/" .. component_name .. ".component.html")
	end
end, { desc = "Angular: Go to Component template" })

vim.keymap.set("n", "<leader>gt", function()
	local filename = vim.fn.expand("%:t:r")
	local component_name = filename:gsub("%..*$", "")
	vim.cmd("edit %:h/" .. component_name .. ".component.html")
end, { desc = "Angular: Go to Template" })

vim.keymap.set("n", "<leader>gs", function()
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
end, { desc = "Angular: Go to Styles" })

vim.keymap.set("n", "<leader>gf", function()
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
end, { desc = "Angular: Extract to Component" })

vim.keymap.set("n", "<leader>as", function()
	vim.lsp.buf.document_symbol()
end, { desc = "Angular: Show Structure" })

-- TypeScript/JavaScript keybindings
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
end, { desc = "TypeScript: Toggle Test File" })

vim.keymap.set("n", "<leader>fr", function()
	local current_file = vim.fn.expand("%:p")
	local new_file = vim.fn.input("New file name: ", vim.fn.expand("%:p:h") .. "/", "file")
	if new_file ~= "" then
		vim.cmd("saveas " .. new_file)
		vim.cmd("edit " .. current_file)
		vim.cmd("bdelete! " .. new_file)
	end
end, { desc = "TypeScript: Rename File" })

vim.keymap.set("n", "<leader>fi", function()
	vim.lsp.buf.implementation()
end, { desc = "TypeScript: Find Implementations" })

vim.keymap.set("n", "<leader>fo", function()
	Snacks.picker.symbols()
end, { desc = "TypeScript: File Outline" })

vim.keymap.set("n", "<leader>fu", function()
	vim.lsp.buf.code_action({ context = { only = { "quickfix" } } })
end, { desc = "TypeScript: Find Unused Imports" })
