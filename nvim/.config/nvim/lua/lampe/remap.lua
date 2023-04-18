vim.g.mapleader = " "
-- vim.keymap.set("n", "<l:ader>px", vim.cmd.Ex, { desc = "Open Ex" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "page up and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "page down and center" })
vim.keymap.set("n", "n", "nzzv", { desc = "find next and center" })
vim.keymap.set("n", "N", "Nzzv", { desc = "find prev and center" })
vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>i", { desc = "Save file" })
vim.keymap.set("n", "<leader>b", ":bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>p", ":bprev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "Toggle Nvim Tree" })
vim.keymap.set("n", "<leader>s", ":NvimTreeFindFile<cr>", { desc = "Show file in Nvim Tree" })
