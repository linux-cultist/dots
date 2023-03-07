local M = {
	"Pocco81/true-zen.nvim",
	event = "VeryLazy",
	enabled = false,
	config = function()
		local truezen = require("true-zen")
		truezen.setup({
			integrations = {
				lualine = true,
			},
		})
	end,
	keys = {
		{
			"<leader>z",
			"<cmd>TZAtaraxis<cr>",
			desc = "ZenMode",
			silent = true,
		},
	},
}

return M
