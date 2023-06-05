-- vim.cmd('colorscheme rose-pine')
-- vim.cmd('colorscheme dracula')
-- vim.cmd [[colorscheme tokyonight-night]]
-- vim.cmd [[colorscheme catppuccin-mocha]]
-- vim.cmd [[colorscheme kanagawa-wave]]

require('nightfox').setup({
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
        }
    }
})
vim.cmd("colorscheme duskfox")
require('nvim-highlight-colors').setup {}
