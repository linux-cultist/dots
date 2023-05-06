local M = {
	"folke/tokyonight.nvim",
	enabled = true,
	priority = 1000,
	lazy = false,
	opts = function()
		return {
			style = "moon",
			transparent = false,
			styles = {},
			on_colors = function(colors)
				-- colors.border = "#565f89"
				colors.border = "orange"
			end,
			on_highlights = function(hl, c)
				hl.CursorLineNr = { fg = c.orange, bold = true }
				hl.NvimTreeWinSeparator = { fg = c.orange, bold = false }
				hl.WinSeparator = { fg = c.orange, bold = false }
				hl.ActiveWindow = { bg = "#662436", bold = false }
				hl.InactiveWindow = { bg = "#662436", bold = false }
			end,
		}
	end,

	config = function(_, opts)
		local tokyonight = require("tokyonight")
		tokyonight.setup(opts)
		tokyonight.load()
	end,
}

return M
