local M = {
	"beauwilliams/focus.nvim",
	enabled = false,
	config = function()
		require("focus").setup()
	end,
	event = "VeryLazy",
}

return M
