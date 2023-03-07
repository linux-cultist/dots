local M = {
	"beauwilliams/focus.nvim",
	config = function()
		require("focus").setup()
	end,
	event = "VeryLazy",
}

return M
