local M = {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = "nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	enabled = false,
}

function M.config()
	-- You don't need to set any of these options.
	-- IMPORTANT!: this is only a showcase of how you can set default options!
	require("telescope").setup({
		extensions = {
			file_browser = {
				path = "%:p:h",
				hidden = true,
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	})
	-- To get telescope-file-browser loaded and working with telescope,
	-- you need to call load_extension, somewhere after setup function:
	require("telescope").load_extension("file_browser")

	vim.keymap.set("n", "<leader><return>", ":Telescope file_browser<cr>", { desc = "File Browser", silent = true })
end

return M
