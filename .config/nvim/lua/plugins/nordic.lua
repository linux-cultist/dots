local M = {
	"AlexvZyl/nordic.nvim",
	priority = 1000,
	lazy = false,
	enabled = false,

	config = function(_, opts)
		require("nordic").load()
	end,
}

return M
