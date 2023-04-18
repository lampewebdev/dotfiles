vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]],
    { desc = "restore the session for the current folder" })
vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]],
    { desc = "rstore the last session" })
vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]],
    { desc = "stop persistence from saving the current session" })
