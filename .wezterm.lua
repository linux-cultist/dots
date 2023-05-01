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
	-- config.default_prog = { "zellij" }

	config.window_frame = {
		inactive_titlebar_bg = "#353535",
		active_titlebar_bg = "#2b2042",
		inactive_titlebar_fg = "#cccccc",
		active_titlebar_fg = "#ffffff",
		inactive_titlebar_border_bottom = "#2b2042",
		active_titlebar_border_bottom = "#2b2042",
		button_fg = "#cccccc",
		button_bg = "#2b2042",
		button_hover_fg = "#ffffff",
		button_hover_bg = "#3b3052",
		border_left_width = "0.5cell",
		border_right_width = "0.5cell",
		border_bottom_height = "0.25cell",
		border_top_height = "0.25cell",
		border_left_color = "purple",
		border_right_color = "purple",
		border_bottom_color = "purple",
		border_top_color = "purple",
	}


	-- config.window_decorations = "RESIZE"
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
