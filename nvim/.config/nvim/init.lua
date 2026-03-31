require("settings")

-- Set leader key BEFORE loading keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("keymaps")
require("lazysetup")
require("lsp")
