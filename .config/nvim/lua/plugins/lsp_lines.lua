local M = {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	event = "VeryLazy",
	config = function(_, opts)
		require("lsp_lines").setup()
		vim.keymap.set("n", "<localleader>id", require("lsp_lines").toggle, { desc = "Inline Diagnostics" })
		vim.diagnostic.config({ virtual_lines = false })
	end,
}

return M
