local M = {
	"ggandor/leap.nvim",
	event = "VeryLazy",
	config = true,
	enabled = false,
	keys = {
		{
			"<leader>S",
			"<Plug>(leap-backward-till)",
			desc = "Leap backward",
		},
		{
			"<leader>l",
			"<Plug>(leap-cross-window)",
			desc = "Leap cross window",
		},
		{

			"<leader>s",
			"<Plug>(leap-forward-till)",
			desc = "Leap forward",
		},
	},
}

return M
