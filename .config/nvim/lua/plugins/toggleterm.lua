function _G.set_terminal_keymaps()
	vim.keymap.set("t", "<M-Left>", [[<Cmd>wincmd h<CR>]])
	vim.keymap.set("t", "<M-Down>", [[<Cmd>wincmd j<CR>]])
	vim.keymap.set("t", "<M-Up>", [[<Cmd>wincmd k<CR>]])
	vim.keymap.set("t", "<M-Right>", [[<Cmd>wincmd l<CR>]])
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	enabled = false,
	opts = function()
		return {
			size = vim.o.columns * 0.4,
			open_mapping = [[<c-t>]],
			autochdir = true,
			direction = "vertical",
			shade_terminals = false,
		}
	end,
	config = function(_, opts)
		require("toggleterm").setup(opts)
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
		vim.cmd("autocmd! TermOpen term://* lua _G.set_terminal_keymaps()")

		-- -- Set up lazygit inside a toggleterm instance
		-- local Terminal = require("toggleterm.terminal").Terminal
		--
		-- -- Set count to 9 so we can use terminal 1-8 from keyboard: 2<C-t> etc.
		--
		-- function Lazygit_toggle()
		-- 	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, count = 9, dir = vim.fn.getcwd() })
		-- 	lazygit:toggle()
		-- end
		--
		-- vim.api.nvim_set_keymap(
		-- 	"n",
		-- 	"<localleader>z",
		-- 	"<cmd>lua Lazygit_toggle()<CR>",
		-- 	{ noremap = true, silent = true }
		-- )
	end,
}

return M
