local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')

local grep_args = { '--hidden', '--glob', '!**/.git/*' }

telescope.setup({
    defaults = {
        path_display = { "truncate" },
        layout_strategy = 'horizontal',
        layout_config = {
            height = vim.o.lines,
            width = vim.o.columns,
            -- horizontal = {
            --     prompt_position = "bottom",
            --
            --     -- preview_width = 0.7,
            --     -- results_width = 0.8,
            -- },
            -- vertical = {
            --     mirror = false,
            -- },
        },
        mappings = {
            i = {
                ['<esc>'] = actions.close
            },
        },
    },
    pickers = {
        find_files = {
            find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' }
        },
        live_grep = {
            additional_args = function()
                return grep_args
            end
        },
        grep_string = {
            additional_args = function()
                return grep_args
            end
        },
    },
})

vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tg', builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set('n', '<leader>tl', builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>ts', builtin.grep_string, { desc = "Telescope grep string" })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>tc', builtin.commands, { desc = "Telescope commands" })
vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = "Telescope keymaps" })
vim.keymap.set('n', '<leader>th', builtin.git_bcommits, { desc = "Telescope file git history" })
vim.keymap.set('n', '<leader>tr', builtin.lsp_references, { desc = "Telescope find references" })
vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = "Telescope find diagnostics" })
vim.keymap.set('n', '<leader>ta', builtin.resume, { desc = "Telescope Resume" })
