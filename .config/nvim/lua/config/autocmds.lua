-- function _G.set_terminal_keymaps()
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
--   vim.keymap.set('t', '<M-Left>', [[<Cmd>wincmd h<CR>]])
--   vim.keymap.set('t', '<M-Down>', [[<Cmd>wincmd j<CR>]])
--   vim.keymap.set('t', '<M-Up>', [[<Cmd>wincmd k<CR>]])
--   vim.keymap.set('t', '<M-Right>', [[<Cmd>wincmd l<CR>]])
-- end
--

local function open_nvim_tree()
	-- open the tree
	require("nvim-tree.api").tree.open()
end

-- vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
-- vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- vim.cmd [[autocmd BufWinEnter,WinEnter term* startinsert]]
-- vim.cmd([[autocmd TermOpen term://* lua set_terminal_keymaps()]])
-- vim.cmd([[autocmd TermOpen term://* setlocal nonumber norelativenumber]])
-- vim.cmd [[autocmd BufWinEnter,WinEnter term://* startinsert]]
-- vim.cmd [[autocmd TermOpen * startinsert]]
