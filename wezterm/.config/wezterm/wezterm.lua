local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

wezterm.on("gui-startup", function()
    wezterm.sleep_ms(1)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

config.color_scheme = 'Tokyo Night Moon'
-- config.color_scheme = 'tokyonight_night'
config.font_size = 16
-- config.font = wezterm.font 'Kode Mono'
-- config.font = wezterm.font 'Monaspace Krypton'
-- config.font = wezterm.font 'Zed Mono'
-- config.freetype_load_flags = "NO_HINTING"
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
return config
