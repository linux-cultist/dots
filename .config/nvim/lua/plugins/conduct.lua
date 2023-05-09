return {
	"git@github.com:aaditeynair/conduct.nvim.git",
	event = "VeryLazy",
	config = function()
		require("conduct").setup()

		require("telescope").load_extension("conduct")
		vim.keymap.set("n", "<leader><enter>", ":Telescope conduct projects<cr>")
	end,
}
