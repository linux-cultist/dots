local M = {
	"kazhala/close-buffers.nvim",
	event = "VeryLazy",
	opts = {
		filetype_ignore = {}, -- Filetype to ignore when running deletions
		file_glob_ignore = {}, -- File name glob pattern to ignore when running deletions (e.g. '*.md')
		file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
		preserve_window_layout = { "this", "nameless" }, -- Types of deletion that should preserve the window layout
		next_buffer_cmd = nil, -- Custom function to retrieve the next buffer when preserving window layout
	},
	config = function(_, opts)
		require("close_buffers").setup(opts)
	end,
	keys = {
		{
			"<leader>bd",
			"<cmd>lua require('close_buffers').delete({type = 'this'})<cr>",
			noremap = true,
			silent = true,
		},
	},
}

return M
