-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = {}
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
	config.font = wezterm.font("Jetbrains Mono", { weight = "Medium" })
	config.color_scheme = "Ayu Mirage"
	config.tab_bar_at_bottom = true

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
