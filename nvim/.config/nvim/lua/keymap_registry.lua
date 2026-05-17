-- Data-driven keybinding registry
-- Replaces repetitive keymap.set() calls with centralized structure
local M = {}

-- LSP keybindings (generic)
M.lsp = {
	{
		key = "<leader>rn",
		fn = "rename",
		desc = "[R]e[n]ame",
	},
	{
		key = "<leader>ca",
		fn = "code_action",
		desc = "[C]ode [A]ction",
	},
	{
		key = "K",
		fn = "hover",
		desc = "Hover Documentation",
	},
}

-- Snacks picker keybindings (file/search)
M.snacks_picker = {
	{
		key = "<leader>N",
		cmd = "explorer",
		desc = "Toggle Explorer",
	},
	{
		key = "<leader><space>",
		cmd = "buffers",
		desc = "Buffers",
	},
	{
		key = "<leader>sf",
		cmd = "smart",
		desc = "Find Files",
	},
	{
		key = "<leader>sg",
		cmd = "grep",
		desc = "Grep",
	},
	{
		key = "<leader>sr",
		cmd = "recent",
		desc = "Recent",
	},
}

-- Git keybindings (snacks)
M.git = {
	{
		key = "<leader>gb",
		cmd = "git_branches",
		desc = "Git Branches",
	},
	{
		key = "<leader>gl",
		cmd = "git_log",
		desc = "Git Log",
	},
	{
		key = "<leader>gL",
		cmd = "git_log_line",
		desc = "Git Log Line",
	},
	{
		key = "<leader>gst",
		cmd = "git_status",
		desc = "Git Status",
	},
	{
		key = "<leader>gS",
		cmd = "git_stash",
		desc = "Git Stash",
	},
	{
		key = "<leader>gd",
		cmd = "git_diff",
		desc = "Git Diff (Hunks)",
	},
	{
		key = "<leader>gF",
		cmd = "git_log_file",
		desc = "Git Log File",
	},
}

-- LSP nav keybindings (snacks)
M.lsp_nav = {
	{
		key = "gd",
		cmd = "lsp_definitions",
		desc = "Goto Definition",
	},
	{
		key = "gD",
		cmd = "lsp_declarations",
		desc = "Goto Declaration",
	},
	{
		key = "gr",
		cmd = "lsp_references",
		desc = "References",
	},
	{
		key = "gI",
		cmd = "lsp_implementations",
		desc = "Goto Implementation",
	},
	{
		key = "gy",
		cmd = "lsp_type_definitions",
		desc = "Goto T[y]pe Definition",
	},
	{
		key = "<leader>ss",
		cmd = "lsp_symbols",
		desc = "LSP Symbols",
	},
	{
		key = "<leader>sS",
		cmd = "lsp_workspace_symbols",
		desc = "LSP Workspace Symbols",
	},
}

-- Angular keybindings
M.angular = {
	{
		key = "<leader>agc",
		cmd = "component",
		desc = "Go to Component template",
	},
	{
		key = "<leader>agt",
		cmd = "template",
		desc = "Go to Template",
	},
	{
		key = "<leader>ags",
		cmd = "styles",
		desc = "Go to Styles",
	},
	{
		key = "<leader>agf",
		cmd = "related_files",
		desc = "Find related files",
	},
	{
		key = "<leader>agss",
		cmd = "structure",
		desc = "Show Structure",
	},
}

-- TypeScript/JavaScript keybindings
M.typescript = {
	{
		key = "<leader>ft",
		cmd = "toggle_test",
		desc = "Toggle Test File",
	},
	{
		key = "<leader>fr",
		cmd = "rename_file",
		desc = "Rename File",
	},
	{
		key = "<leader>fi",
		cmd = "find_impl",
		desc = "Find Implementations",
	},
	{
		key = "<leader>fo",
		cmd = "outline",
		desc = "File Outline",
	},
	{
		key = "<leader>fu",
		cmd = "find_unused",
		desc = "Find Unused Imports",
	},
}

return M
