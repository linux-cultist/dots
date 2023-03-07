local M = {
	"nyngwang/suave.lua",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require('suave').setup {
			-- menu_height = 6,
			auto_save = {
				enabled = true,
				-- exclude_filetypes = {},
			},
			store_hooks = {
				-- WARN: DON'T call `vim.cmd('wa')` here. Use `setup.auto_save` instead. (See #4)
				before_mksession = {
					-- function ()
					--   -- `rcarriga/nvim-dap-ui`.
					--   require('dapui').close()
					-- end,
					-- function ()
					--   -- `nvim-neo-tree/neo-tree.nvim`.
					--   for _, w in ipairs(vim.api.nvim_list_wins()) do
					--     if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(w), 'ft') == 'neo-tree' then
					--       vim.api.nvim_win_close(w, false)
					--     end
					--   end
					-- end,
				},
				after_mksession = {
					-- NOTE: the `data` param is Lua table, which will be stored in json format under `.suave/` folder.
					function(data)
						-- store current colorscheme.
						data.colorscheme = vim.g.colors_name
					end,
				},
			},
			restore_hooks = {
				after_source = {
					function(data)
						if not data then return end
						-- restore colorscheme.
						vim.cmd(string.format([[
              color %s
              doau ColorScheme %s
            ]], data.colorscheme, data.colorscheme))
					end,
				},
			}
		}
	end
}

return M
