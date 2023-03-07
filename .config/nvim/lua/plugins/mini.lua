local M = {
	"echasnovski/mini.nvim",
	version = false,
	event = "VeryLazy",
	config = function()

		require("mini.ai").setup()

		require("mini.surround").setup({
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find_left = "sF", -- Find surrounding (to the left)
				find = "sf", -- Find surrounding (to the right)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
	end,
}

return M
