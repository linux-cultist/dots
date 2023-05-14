return {
	"mrjones2014/smart-splits.nvim",
	build = "./kitty/install-kittens.bash",
	event = "VeryLazy",
	config = true,
	keys = {
		{
			"<M-Left>",
			function()
				require("smart-splits").move_cursor_left()
			end,
			desc = "Move cursor to left window",
		},
		{
			"<M-Down>",
			function()
				require("smart-splits").move_cursor_down()
			end,
			desc = "Move cursor to window down",
		},
		{
			"<M-Up>",
			function()
				require("smart-splits").move_cursor_up()
			end,
			desc = "Move cusror to window up",
		},
		{
			"<M-Right>",
			function()
				require("smart-splits").move_cursor_right()
			end,
			desc = "Move cursor to right window",
		},
		{
			"<M-S-Left>",
			function()
				require("smart-splits").resize_left()
			end,
			desc = "Move cursor to left window",
		},
		{
			"<M-S-Down>",
			function()
				require("smart-splits").resize_down()
			end,
			desc = "Move cursor to window down",
		},
		{
			"<M-S-Up>",
			function()
				require("smart-splits").resize_up()
			end,
			desc = "Move cusror to window up",
		},
		{
			"<M-S-Right>",
			function()
				require("smart-splits").resize_right()
			end,
			desc = "Move cursor to right window",
		},
	},
}
