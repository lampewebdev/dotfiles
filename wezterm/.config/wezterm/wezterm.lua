local utf8 = require("utf8")
local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "rose-pine"
config.color_scheme = "Gruvbox dark, hard (base16)"
config.font_size = 17
-- config.font = wezterm.font("MesloLGL Nerd Font", {})
-- config.font = wezterm.font({
-- 	family = "Monaspace Argon",
-- 	weight = "Bold",
-- })
-- config.font = wezterm.font({
-- 	family = "Monaspace Neon",
-- 	-- weight = "Bold",
-- })
-- config.font = wezterm.font("Monaspace Krypton", { weight = "DemiBold" })
-- config.font = wezterm.font("Monaspace Krypton Var", { weight = "Bold" })
-- config.font = wezterm.font("Monaspace Neon", {})
-- config.font = wezterm.font("Monaspace Radon", {})
-- config.font = wezterm.font("Monaspace Xenon", {})

-- config.font = wezterm.font({
-- 	family = "Comic Mono",
-- 	weight = "DemiBold",
-- })
-- config.font = wezterm.font({
-- 	family = "Lilex",
-- })
-- config.font = wezterm.font({
-- 	family = "CommitMono",
-- })
config.font = wezterm.font({
	family = "0xProto",
})
-- config.line_height = 1.09
-- config.cell_width = 1.05
-- config.front_end = "WebGpu"
-- config.freetype_load_flags = "NO_HINTING"
-- config.freetype_load_target = "Mono"
-- config.freetype_load_target = "Light"
-- config.freetype_render_target = "HorizontalLcd"
config.window_decorations = "RESIZE"
--
--
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.max_fps = 120

-- Leader is the same as my old tmux prefix
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "f",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "H",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
}

config.tab_and_split_indices_are_zero_based = true
for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#000" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#000" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
