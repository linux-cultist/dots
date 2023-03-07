local M = {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	opts = function()
		return {
			style = "moon",
			transparent = false,
			styles = {},
			on_colors = function(colors)
				colors.border = "#565f89"
			end,
			on_highlights = function(hl, c)
				-- make the current line cursor orange
				hl.CursorLineNr = { fg = c.orange, bold = true }

				if true then
					-- borderless telescope
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = c.fg_gutter,
						fg = c.orange,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end
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
