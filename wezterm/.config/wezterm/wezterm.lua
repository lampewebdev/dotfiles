local utf8 = require("utf8")
local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Left Option = Alt (vmux binds); right Option still composes chars (€, ñ, ~)
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Code Villain, from the vault (code/apps/theme/wezterm): night when macOS is
-- dark, day when it is light. WezTerm re-reads this when the appearance
-- changes. Was "Tokyo Night Moon".
config.color_scheme_dirs = { wezterm.home_dir .. "/code/villain/villain-vault/code/apps/theme/wezterm" }
local function scheme_for(appearance)
	return appearance:find("Dark") and "Code Villain Night" or "Code Villain Day"
end
config.color_scheme = scheme_for(wezterm.gui and wezterm.gui.get_appearance() or "Dark")
config.font_size = 14.5
config.font = wezterm.font({
	family = "0xProto",
})
config.window_decorations = "RESIZE"

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.max_fps = 120
config.default_cursor_style = "BlinkingBlock"

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
		key = "e",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "i",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "o",
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
for i = 1, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	-- The tab bar's own colour, from the active scheme.
	local bar = window:effective_config().resolved_palette.tab_bar.background
	local ARROW_FOREGROUND = { Foreground = { Color = bar } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	window:set_left_status(wezterm.format({
		{ Background = { Color = bar } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

return config
