-- DAP keybinding registry
-- Data structure for all debug keybindings
local M = {}

M.dap_keys = {
	{
		key = "<leader>dB",
		method = "set_breakpoint",
		input = "Breakpoint condition: ",
		desc = "Breakpoint Condition",
	},
	{
		key = "<leader>db",
		method = "toggle_breakpoint",
		desc = "Toggle Breakpoint",
	},
	{
		key = "<leader>dc",
		method = "continue",
		desc = "Run/Continue",
	},
	{
		key = "<leader>da",
		method = "continue",
		desc = "Run with Args",
	},
	{
		key = "<leader>dC",
		method = "run_to_cursor",
		desc = "Run to Cursor",
	},
	{
		key = "<leader>dg",
		method = "goto_",
		desc = "Go to Line (No Execute)",
	},
	{
		key = "<leader>di",
		method = "step_into",
		desc = "Step Into",
	},
	{
		key = "<leader>dj",
		method = "down",
		desc = "Down",
	},
	{
		key = "<leader>dk",
		method = "up",
		desc = "Up",
	},
	{
		key = "<leader>dl",
		method = "run_last",
		desc = "Run Last",
	},
	{
		key = "<leader>do",
		method = "step_out",
		desc = "Step Out",
	},
	{
		key = "<leader>dO",
		method = "step_over",
		desc = "Step Over",
	},
	{
		key = "<leader>dP",
		method = "pause",
		desc = "Pause",
	},
	{
		key = "<leader>dr",
		method = "repl.toggle",
		desc = "Toggle REPL",
	},
	{
		key = "<leader>ds",
		method = "session",
		desc = "Session",
	},
	{
		key = "<leader>dt",
		method = "terminate",
		desc = "Terminate",
	},
	{
		key = "<leader>dw",
		method = "ui.widgets.hover",
		desc = "Widgets",
	},
}

return M
