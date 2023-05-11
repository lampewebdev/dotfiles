require("neoconf").setup({
    -- override any of the default settings here
})

local lsp = require('lsp-zero').preset({})
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    log_level = vim.log.levels.DEBUG
})
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'tsserver',
    'eslint',
    'rust_analyzer',
    'prosemd_lsp',
    'jsonls'
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.format_on_save({
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
    }
})
local util = require('lspconfig.util')

lsp.configure('angularls', {
    root_dir = util.root_pattern('angular.json', 'package.json')
})


lsp.setup()

vim.diagnostic.config()
local opts = { noremap = true, silent = true }
opts.desc = "go to prev lsp"
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_prev, opts)
opts.desc = "go to next lsp"
vim.keymap.set('n', '<leader>r', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_next, opts)
opts.desc = "format file lsp"
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
opts.desc = "jump to implementation lsp"
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
opts.desc = "Show Code Actions"
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
opts.desc = "Show Code Actions"
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)
opts.desc = "Open Info Float"
vim.keymap.set('n', '<leader>lo', vim.diagnostic.open_float, opts)
opts.desc = "Decclartion"
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)
opts.desc = "Definition"
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
opts.desc = "Type Definition"
vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
opts.desc = "Hover: show desc"
vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, opts)
opts.desc = "signature"
vim.keymap.set('n', '<leader>n', vim.lsp.buf.signature_help, opts)

local cmp = require('cmp')

cmp.setup({
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer',                  keyword_length = 3 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp_document_symbol' },
    }, {
        { name = 'buffer' },
    }),
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    experimental = {
        ghost_text = true,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-k>'] = cmp.mapping.select_next_item(),
        ['<C-j>'] = cmp.mapping.select_prev_item(),
        ['<C-l>'] = cmp.mapping.abort(),
        ['<C-CR>'] = cmp.mapping.complete(),
    }),
})
