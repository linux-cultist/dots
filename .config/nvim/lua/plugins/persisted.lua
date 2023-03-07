local M = {
	"olimorris/persisted.nvim",
	event = "VeryLazy",
	enabled = false,
	-- config = true,
	config = function()
		require("persisted").setup()
	 	require("telescope").load_extension("persisted")
	 end,
	-- dependencies = { "nvim-telescope/telescope.nvim" },
	-- require("persisted").setup()
	-- require("telescope").load_extension("persisted")
	-- end,
	-- config = function()
	-- 	require("persisted").setup()
	-- require("telescope").load_extension("persisted") -- To load the telescope extension
	-- end,
	keys = { {
		"<leader><Return>",
		"<cmd>Telescope persisted<cr>",
		desc = "Sessions",
	} },
}

return M
