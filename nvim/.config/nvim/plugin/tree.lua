require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
        },
        follow_current_file = {
            enabled = true,
        }
    },
})
