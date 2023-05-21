local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

wezterm.on("gui-startup", function()
    wezterm.sleep_ms(1)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

config.color_scheme = 'rose-pine'
-- config.color_scheme = 'tokyonight_night'
config.font_size = 17
-- config.freetype_load_flags = "NO_HINTING"
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
return config
