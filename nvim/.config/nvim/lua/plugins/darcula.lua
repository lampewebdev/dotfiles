return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
		priority = 1000,
		config = function()
			require("dracula").setup({
                italic_comment = true,
                show_end_of_buffer = true,
                transparent_bg = true,
            })
        end
    },
}
