local M = {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	enabled = false,
	config = function()
		local harpoon_ui = require("harpoon.ui")
		local harpoon_mark = require("harpoon.mark")
		local buffers = 4

		for i = 1, buffers do
			vim.keymap.set('n', '<M-' .. i .. '>', function() harpoon_ui.nav_file(i) end,
				{ silent = true, desc = "Harpoon - Navigate to file " .. i })
		end

		vim.keymap.set('n', '<M-s>', harpoon_ui.toggle_quick_menu,
			{ silent = true, desc = "Harpoon - Toggle Quick Menu" })
		vim.keymap.set('n', '<M-a>', harpoon_mark.add_file,
			{ silent = true, desc = "Harpoon - Add File" })
		vim.keymap.set('n', '<M-q>', harpoon_ui.nav_prev,
			{ silent = true, desc = "Harpoon - Navigate to next file" })
		vim.keymap.set('n', '<M-w>', harpoon_ui.nav_next,
			{ silent = true, desc = "Harpoon - Navigate to previous file" })
	end
}


return M
