local M = {
	"folke/trouble.nvim",
	event = "VeryLazy",
	opts = { position = "bottom", padding = false, auto_preview = false },
	keys = { { "<localleader>w", "<cmd>TroubleToggle workspace_diagnostics<cr>", }, { "<localleader>e", "<cmd>TroubleToggle document_diagnostics<cr>", } }
}

return M
