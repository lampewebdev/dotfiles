require("neo-tree").setup({
    close_if_last_window = false,
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        },
        follow_current_file = { enable = true },
    },
})
