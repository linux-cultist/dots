return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	event = "VeryLazy",
	config = function(_, opts)
		require("telescope").setup({
			pickers = {
				find_files = {
					file_ignore_patterns = { "venv/", "__pycache__/", ".git/", ".idea/" },
				},
			},
		})
	end,
}
