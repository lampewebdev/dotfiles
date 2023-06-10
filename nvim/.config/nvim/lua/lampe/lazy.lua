local lazypath = vim.fn.stdpath('data') .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'tpope/vim-fugitive',
    'folke/neodev.nvim',
    'brenoprata10/nvim-highlight-colors',
    'folke/neoconf.nvim',
    'Mofiqul/dracula.nvim',
    -- {
    --     'oxfist/night-owl.nvim',
    --     name = 'night-owl',
    --     priority = 1000,
    -- },
    'folke/tokyonight.nvim',
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
    },
    'rebelot/kanagawa.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'gerazov/toggle-bool.nvim',
    'lewis6991/gitsigns.nvim',
    'EdenEast/nightfox.nvim',
    'goolord/alpha-nvim',
    'nvim-lualine/lualine.nvim',
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate'
            },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/vim-vsnip',
                    'hrsh7th/vim-vsnip',
                    'hrsh7th/cmp-vsnip'
                }
            },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
            { 'hrsh7th/cmp-path' },
        }
    },
    'simrat39/rust-tools.nvim',
    'aznhe21/actions-preview.nvim',
    'hood/popui.nvim',
    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 50
            require('which-key').setup({})
        end,
    },
    'sindrets/diffview.nvim',
    'nvim-tree/nvim-tree.lua',
    'MunifTanjim/nui.nvim',
    'numToStr/Comment.nvim',
    {
        'folke/persistence.nvim',
        event = 'BufReadPre', -- this will only start session saving when an actual file was opened
        module = 'persistence',
        config = function()
            require('persistence').setup()
        end,
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2',
    }
}
local opts = {}

require('lazy').setup(plugins, opts)
