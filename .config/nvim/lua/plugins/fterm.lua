local M = {
	"numToStr/FTerm.nvim",
	config = function()
		vim.keymap.set("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<Esc>", '<C-\\><C-n>')
		vim.keymap.set("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
	event = "VeryLazy",
	enabled = false
}

return M
