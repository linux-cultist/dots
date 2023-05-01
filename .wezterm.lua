-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
	config.font = wezterm.font("Jetbrains Mono", { weight = "Regular" })
	config.color_scheme = "Ayu Mirage"
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
	config.window_background_opacity = 1.0
	config.text_background_opacity = 1.0
	config.hide_mouse_cursor_when_typing = false

	config.keys = {
		{
			key = "Return",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal,
		},
		{
			key = "Backspace",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical,
		},
	}
	return config
end
