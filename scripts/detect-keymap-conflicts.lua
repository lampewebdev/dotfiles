#!/usr/bin/env lua
-- Keymap conflict detector
-- Scans all keybinding definitions and reports conflicts
-- Usage: lua scripts/detect-keymap-conflicts.lua

local function detect_conflicts()
	local keymaps = {}
	local conflicts = {}

	-- Define all keybindings in one place
	local bindings = {
		-- Core keybindings
		{ mode = "n", key = "<Esc>", file = "keymaps.lua" },
		{ mode = "n", key = "[d", file = "keymaps.lua" },
		{ mode = "n", key = "]d", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>e", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>q", file = "keymaps.lua" },
		{ mode = "nv", key = "<leader>y", file = "keymaps.lua" },
		{ mode = "nv", key = "<leader>p", file = "keymaps.lua" },
		{ mode = "nv", key = "<leader>P", file = "keymaps.lua" },
		{ mode = "v", key = "<C-j>", file = "keymaps.lua" },
		{ mode = "v", key = "<C-k>", file = "keymaps.lua" },

		-- Angular keybindings (now agXX prefix)
		{ mode = "n", key = "<leader>agc", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>agt", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>ags", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>agf", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>ec", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>agss", file = "keymaps.lua" },

		-- TypeScript keybindings
		{ mode = "n", key = "<leader>ft", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>fr", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>fi", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>fo", file = "keymaps.lua" },
		{ mode = "n", key = "<leader>fu", file = "keymaps.lua" },

		-- Snacks picker
		{ mode = "n", key = "<leader>N", file = "snacks.lua" },
		{ mode = "n", key = "<leader><space>", file = "snacks.lua" },
		{ mode = "n", key = "<leader>sf", file = "snacks.lua" },
		{ mode = "n", key = "<leader>sg", file = "snacks.lua" },
		{ mode = "n", key = "<leader>sr", file = "snacks.lua" },

		-- Git keybindings
		{ mode = "n", key = "<leader>gb", file = "snacks.lua" },
		{ mode = "n", key = "<leader>gl", file = "snacks.lua" },
		{ mode = "n", key = "<leader>gL", file = "snacks.lua" },
		{ mode = "n", key = "<leader>gst", file = "snacks.lua" },
		{ mode = "n", key = "<leader>gS", file = "snacks.lua" },
		{ mode = "n", key = "<leader>gd", file = "snacks.lua" },
		{ mode = "n", key = "<leader>gF", file = "snacks.lua" },

		-- LSP navigation
		{ mode = "n", key = "gd", file = "snacks.lua" },
		{ mode = "n", key = "gD", file = "snacks.lua" },
		{ mode = "n", key = "gr", file = "snacks.lua" },
		{ mode = "n", key = "gI", file = "snacks.lua" },
		{ mode = "n", key = "gy", file = "snacks.lua" },
		{ mode = "n", key = "<leader>ss", file = "snacks.lua" },
		{ mode = "n", key = "<leader>sS", file = "snacks.lua" },

		-- LSP core
		{ mode = "n", key = "<leader>rn", file = "lsp.lua" },
		{ mode = "n", key = "<leader>ca", file = "lsp.lua" },
		{ mode = "n", key = "K", file = "lsp.lua" },

		-- DAP keybindings
		{ mode = "n", key = "<leader>dB", file = "dap.lua" },
		{ mode = "n", key = "<leader>db", file = "dap.lua" },
		{ mode = "n", key = "<leader>dc", file = "dap.lua" },
		{ mode = "n", key = "<leader>da", file = "dap.lua" },
		{ mode = "n", key = "<leader>dC", file = "dap.lua" },
		{ mode = "n", key = "<leader>dg", file = "dap.lua" },
		{ mode = "n", key = "<leader>di", file = "dap.lua" },
		{ mode = "n", key = "<leader>dj", file = "dap.lua" },
		{ mode = "n", key = "<leader>dk", file = "dap.lua" },
		{ mode = "n", key = "<leader>dl", file = "dap.lua" },
		{ mode = "n", key = "<leader>do", file = "dap.lua" },
		{ mode = "n", key = "<leader>dO", file = "dap.lua" },
		{ mode = "n", key = "<leader>dP", file = "dap.lua" },
		{ mode = "n", key = "<leader>dr", file = "dap.lua" },
		{ mode = "n", key = "<leader>ds", file = "dap.lua" },
		{ mode = "n", key = "<leader>dt", file = "dap.lua" },
		{ mode = "n", key = "<leader>dw", file = "dap.lua" },
	}

	-- Check for conflicts
	for _, binding in ipairs(bindings) do
		local key_id = binding.mode .. ":" .. binding.key
		if keymaps[key_id] then
			table.insert(conflicts, {
				key = binding.key,
				mode = binding.mode,
				files = { keymaps[key_id], binding.file },
			})
		else
			keymaps[key_id] = binding.file
		end
	end

	-- Report findings
	if #conflicts > 0 then
		print("❌ KEYMAP CONFLICTS DETECTED:\n")
		for _, conflict in ipairs(conflicts) do
			print(
				string.format(
					"  %s (%s): defined in %s AND %s",
					conflict.key,
					conflict.mode,
					conflict.files[1],
					conflict.files[2]
				)
			)
		end
		return false
	else
		print("✅ No keymap conflicts detected!")
		print("   Total bindings scanned: " .. #bindings)
		return true
	end
end

if detect_conflicts() then
	os.exit(0)
else
	os.exit(1)
end
