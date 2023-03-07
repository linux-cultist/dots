local M = {
	"gennaro-tedesco/nvim-possession",
	dependencies = {
		"ibhagwan/fzf-lua",
	},
	event = "VeryLazy",
	enabled = false,
	config = true,
	opts = { autoload = true },
	init = function()
		local possession = require("nvim-possession")
		vim.keymap.set("n", "<leader>sl", function()
			possession.list()
		end)
		vim.keymap.set("n", "<leader>sn", function()
			possession.new()
		end)
		vim.keymap.set("n", "<leader>su", function()
			possession.update()
		end)
	end,
}


return M
