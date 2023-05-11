local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'tpope/vim-fugitive',
    "folke/neodev.nvim",
    'brenoprata10/nvim-highlight-colors',
    "folke/neoconf.nvim",
    "Mofiqul/dracula.nvim",
    'folke/tokyonight.nvim',
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine'
    },
    'gerazov/toggle-bool.nvim',
    "rebelot/kanagawa.nvim",
    'lewis6991/gitsigns.nvim',
    "EdenEast/nightfox.nvim",
    'goolord/alpha-nvim',
    'nvim-lualine/lualine.nvim',
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
            --     -- Optional
                'williamboman/mason.nvim',
                build = ":MasonUpdate"
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    "hrsh7th/vim-vsnip",
                    "hrsh7th/vim-vsnip",
                    "hrsh7th/cmp-vsnip"
                }
            },                          -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
            { 'hrsh7th/cmp-path' }, -- Optional
        }
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 50
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    'sindrets/diffview.nvim',
    'nvim-tree/nvim-tree.lua',
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v2.x",
    -- },
    "MunifTanjim/nui.nvim",
    'numToStr/Comment.nvim',
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
            require("persistence").setup()
        end,
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    },
}
local opts = {}

require("lazy").setup(plugins, opts)
