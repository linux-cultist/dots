local M = {
	"phaazon/hop.nvim",
	branch = "v2",
	event = "VeryLazy",
	config = true,
	enabled = true,
	opts = { multi_windows = true },
	keys = {
		{
			"<C-s>",
			":HopPattern<cr>",
		},
	},
}

return M
