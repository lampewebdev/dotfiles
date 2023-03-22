local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup({
    defaults = {
        path_display = { "truncate" },
        layout_strategy = 'horizontal',
        layout_config = {
            height = vim.o.lines,
            width = vim.o.columns,
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.6,
                -- results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
        },
    },
})

vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tg', builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set('n', '<leader>tl', builtin.live_grep, { desc = "telescope live grep" })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>tc', builtin.commands, { desc = "Telescope commands" })
vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = "Telescope keymaps" })
vim.keymap.set('n', '<leader>th', builtin.git_bcommits, { desc = "Telescope file git history" })
vim.keymap.set('n', '<leader>tr', builtin.lsp_references, { desc = "Telescope find references" })
