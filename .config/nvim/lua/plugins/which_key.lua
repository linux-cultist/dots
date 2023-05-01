local M = {
	"folke/which-key.nvim",
	enabled = false,
}

function M.config()
	local wk = require("which-key")
	wk.setup({
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 5
		},
	})

end

return M
