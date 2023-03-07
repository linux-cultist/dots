local M = {
	"folke/persistence.nvim",
	event = "BufReadPre",
	config = true,
	enabled = false,
	keys = { {
		-- restore the session for the current directory
		"<leader>rs", function() require("persistence").load() end
	}, {
		-- restore the last session
		"<leader>ql", function() require("persistence").load({ last = true }) end,
	} }
}

return M
