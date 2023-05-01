function Startswith(text, prefix)
	return text:find(prefix, 1, true) == 1
end

local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	event = "VeryLazy",
	enabled = false,
	keys = {
		{
			"<localleader>bs",
			function()
				require("lualine").hide({ unhide = true })
			end,
			desc = "Show the lualine",
		},
		{
			"<localleader>bh",
			function()
				require("lualine").hide({})
			end,
			desc = "Hide the lualine",
		},
	},
	opts = function()
		local colors = require("tokyonight.colors").moon()

		local vim_icon = {
			function()
				return ""
			end,
			separator = { left = "", right = "" },
			color = { fg = colors.bg, bg = colors.green },
			-- color = { bg = "#fab387", fg = "#1e1e2e" },
			-- color = { bg = "#313244", fg = "#80A7EA" },
		}

		local fileformat = {
			"fileformat",
			color = { fg = colors.green2, bg = colors.bg_dark },
			symbols = {
				unix = "",
				dos = "",
				mac = "",
			},
			separator = { left = "", right = "" },
		}

		-- local mode = {
		-- 	"mode",
		-- 	fmt = function(str)
		-- 		return str:sub(1, 1)
		-- 	end,
		-- 	color = { bg = "#fab387", fg = "#1e1e2e" },
		-- 	separator = { right = "" },
		-- }

		local filepath = {
			function()
				local relative_path = vim.fn.expand("%:.")
				if Startswith(relative_path, "term") then
					-- The current dir is between // and // in the string for term
					-- so we extract that and ignore the rest of the stuff
					-- term://~//blabla
					local lastslash = relative_path:find("//", 7)
					local dir = relative_path:sub(8, lastslash - 1)
					return " " .. dir
				elseif relative_path:len() ~= 0 then
					return "󰿠 " .. string.gsub(relative_path, "/", "󰿟")
				else
					return ""
				end
			end,
			-- path = 1,
			color = { bg = colors.bg_dark, fg = colors.green2 },
			separator = { right = "" },
			-- color = { bg = "#80A7EA", fg = "#242735" },
			-- separator = { left = "", right = "" },
		}
		local filetype = {
			"filetype",
			icon_only = true,
			colored = false,
			separator = { right = "" },
			color = { fg = colors.bg, bg = colors.green },
		}

		local space = {
			function()
				return " "
			end,
			separator = { right = "" },
			color = { bg = colors.bg },
		}

		-- local filetype_tab = {
		-- 	"filetype",
		-- 	icon_only = true,
		-- 	colored = true,
		-- 	color = { bg = "#313244" },
		-- }

		-- local buffer = {
		-- 	-- require("tabline").tabline_buffers,
		-- 	separator = { left = "", right = "" },
		-- }

		-- local tabs = {
		-- 	-- require("tabline").tabline_tabs,
		-- 	color = { bg = colors.bg },
		-- 	separator = { left = "", right = "" },
		-- }

		-- local encoding = {
		-- 	"encoding",
		-- 	color = { bg = colors.blue7, fg = colors.fg },
		-- 	separator = { right = "" },
		-- }

		local branch = {
			"branch",
			-- color = { bg = "#a6e3a1", fg = "#313244" },
			-- color = { bg = theme_colors.green2, fg = "#1e1e2e" },
			separator = { right = "" },
			color = { bg = colors.bg_dark, fg = colors.green2 },
		}

		local dia = {
			"diagnostics",
			color = { bg = colors.bg_dark, fg = colors.green2 },
			colored = false,
			separator = { right = "" },
			update_in_insert = true,
		}

		local diff = {
			"diff",
			color = { bg = colors.bg_dark, fg = colors.green2 },
			colored = false,
			separator = { right = "" },
		}

		local cwd_symbol = {
			function()
				return ""
			end,
			separator = { right = "" },
			color = { fg = colors.bg, bg = colors.green },
		}

		local cwd = {
			function()
				return vim.fn.getcwd()
			end,
			separator = { right = "" },
			color = { bg = colors.bg_dark, fg = colors.green2 },
		}

		local function getLspName()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return "  " .. client.name
				end
			end
			return "  " .. msg
		end

		local lsp = {
			function()
				return getLspName()
			end,
			separator = { right = "" },
			color = { bg = colors.bg_dark, fg = colors.green2 },
		}

		return {
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			-- theme = "onedark",
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
			sections = {
				lualine_a = {
					vim_icon,
					fileformat,
					-- mode,
				},
				lualine_b = {
					-- filepath_icon,
					filepath,
					filetype,
					branch,
					dia,
					lsp,
					diff,
				},
				lualine_c = {
					-- space,
					-- space,
				},
				lualine_x = {
					-- space,
					-- space,
				},
				lualine_y = {
					-- encoding,
					space,
					cwd_symbol,
					cwd,
				},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			-- tabline = {
			-- 	lualine_a = {
			-- 		buffer,
			-- 	},
			-- 	lualine_b = {},
			-- 	lualine_c = {},
			-- 	lualine_x = {
			-- 		tabs,
			-- 	},
			-- 	lualine_y = {
			-- 		space,
			-- 	},
			-- 	lualine_z = {},
			-- },
			winbar = {},
			inactive_winbar = {},
			-- component_separators = { right = "", left = "" },
			-- section_separators = { left = "", right = "" },
			-- section_separators = { right = "", left = "" },
			-- component_separators = { left = "", right = "" },
		}
	end,
	config = function(_, opts)
		require("lualine").setup(opts)

		-- if vim.g.GuiLoaded or vim.g.neovide then -- Hide on gui clients
		-- 	require("lualine").hide({})
		-- end
	end,
}

return M
