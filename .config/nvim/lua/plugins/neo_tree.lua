local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
			follow_current_file = true,
		},
	},
	config = true,
	enabled = false,
	event = "VeryLazy",
	keys = { { "<localleader>t", "<cmd>NeoTreeRevealToggle<cr>", desc = "Focus NeoTree" } },
}

return M
