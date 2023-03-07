local M = {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	enabled = false,
	config = true,
	keys = {
		{
			"<leader>z",
			"<cmd>ZenMode<cr>",
			desc = "ZenMode",
			silent = true,
		},
	},
}

function M.config()
	require("zen-mode").setup({})
end

return M
