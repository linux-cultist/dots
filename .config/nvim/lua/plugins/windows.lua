return {
	"anuvyklack/windows.nvim",
	enabled = false,
	dependencies = {
		"anuvyklack/middleclass",
	},
	event = "VeryLazy",
	config = function()
		require("windows").setup()
		vim.o.equalalways = true
	end,
	keys = {
		{
			"<C-j>",
			"<cmd>WindowsMaximize<cr>",
		},
	},
}
