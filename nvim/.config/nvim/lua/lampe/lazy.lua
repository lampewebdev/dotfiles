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
    { 'nvim-treesitter/nvim-treesitter',  build = ":TSUpdate" },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
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
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    'sindrets/diffview.nvim',
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
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
    }
}
local opts = {}

require('lazy').setup(plugins, opts)
