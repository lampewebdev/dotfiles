require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript",
        "markdown",
        "typescript",
        "rust",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query"
    },
    sync_install = false,
    auto_install = false,
    ignore_install = {},
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
}
