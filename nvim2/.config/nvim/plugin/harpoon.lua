local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():remove()
end)
vim.keymap.set("n", "<leader>ht", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>h1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>h2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>h3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>h4", function()
	harpoon:list():select(4)
end)

vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>he", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>hi", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>ho", function()
	harpoon:list():select(4)
end)
