local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }

function _G.set_terminal_keymaps()
	vim.keymap.set("t", "<M-Left>", [[<Cmd>wincmd h<CR>]])
	vim.keymap.set("t", "<M-Down>", [[<Cmd>wincmd j<CR>]])
	vim.keymap.set("t", "<M-Up>", [[<Cmd>wincmd k<CR>]])
	vim.keymap.set("t", "<M-Right>", [[<Cmd>wincmd l<CR>]])
end

local M = {
	"nyngwang/NeoTerm.lua",
	-- ft = "lua",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("neo-term").setup({
			-- split_on_top = true,
			-- split_size = 0.5,
			exclude_buftypes = { "terminal" }, -- these two options will affect `NeoTermOpen`
			exclude_filetypes = { "neo-tree", "dashboard" },
		})
		_G.set_terminal_keymaps()
		vim.keymap.set("n", "<C-t>", function()
			if vim.bo.buftype == "terminal" then
				vim.cmd("NeoTermClose")
			else
				vim.cmd("NeoTermOpen")
			end
		end, NOREF_NOERR_TRUNC)
		vim.keymap.set("t", "<C-t>", function()
			vim.cmd("NeoTermEnterNormal")
		end, NOREF_NOERR_TRUNC)
	end,
}

return M
