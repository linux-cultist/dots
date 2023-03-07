vim.keymap.set("n", "<localleader>l", ":Lazy<cr>", { silent = true, desc = "Lazy Plugin Manager" })
vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<cr>", { silent = true, desc = "Format Buffer" })
vim.keymap.set("n", "<leader><Esc>", ":set nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<leader>s", "<cmd>HopPattern<cr>")
vim.keymap.set("i", "<C-k>", "<C-o>dt") -- Ctrl-K in insert mode will delete after cursor
vim.keymap.set("n", "<C-k>", "dt") -- Ctrl-K in insert mode will delete after cursor
vim.keymap.set("n", "<A-w>", "dF")
vim.keymap.set("n", "<C-f>", "/") -- Remap search button for no shift needed
vim.keymap.set("n", "<S-M-Left>", ":bprev<cr>") -- Remap search button for no shift needed
vim.keymap.set("n", "<S-M-Right>", ":bnext<cr>") -- Remap search button for no shift needed
vim.keymap.set("n", "<C-w>", ":bd!<cr>", { silent = true })
vim.keymap.set("i", "<C-r>", "<C-r><C-o>")
-- vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("n", "<localleader><localleader>", "<c-6>", { desc = "Jump to Previous Buffer" })
vim.keymap.set("n", "<localleader>p", "<cr>p", { desc = "Paste on next line" })
-- vim.keymap.set("n", "<C-t>", ":vnew | term<cr>", { silent = true, desc = "Open new vertical terminal" })
vim.keymap.set("n", "<C-g>", ":FzfLua grep_cWORD<cr>", { silent = true, desc = "Grep word under cursor" })
vim.keymap.set("v", "<C-g>", ":FzfLua grep_visual<cr>", { silent = true, desc = "Grep word under cursor" })
-- vim.keymap.set("n", "<C-Right>", "<C-w>L", { desc = "Move current window right" })
-- vim.keymap.set("n", "<C-Left>", "<C-w>H", { desc = "Move current window left" })
-- vim.keymap.set("n", "<C-Down>", "<C-w>J", { desc = "Move current window down" })
-- vim.keymap.set("n", "<C-Up>", "<C-w>K", { desc = "Move current window up" })
-- vim.keymap.set("n", "<Tab>", "<C-w>Right", { desc = "Next window" }) -- Requires kitty keykaps to work in terminal
-- vim.keymap.set("n", "<S-Tab>", "<c-w>Left", { desc = "Previous window" }) -- Requires kitty keykaps to work in terminal
vim.keymap.set("n", "'a", "`a", { desc = "Remap mark to exakt position always" }) -- Requires kitty keykaps to work in terminal
vim.keymap.set("n", "''", "``", { desc = "Remap mark to exakt position always" }) -- Requires kitty keykaps to work in terminal
vim.keymap.set("n", "ö", "[`", { desc = "Jump to previous mark position" }) -- Requires kitty keykaps to work in terminal
vim.keymap.set("n", "ä", "]`", { desc = "Jump to next mark position" }) -- Requires kitty keykaps to work in terminal
-- vim.keymap.set("n", "<M-0>", "<C-w>=", { desc = "Unzoom the window" })
-- vim.keymap.set("n", "<M-Return>", "<C-w>|", { desc = "Zoom the window" })
-- vim.keymap.set("n", "<C-s>", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
vim.keymap.set("n", "<C-x>", "<C-o>", { desc = "Go back in jump list" })
vim.keymap.set("n", "<M-Up>", "<C-w><Up>", { desc = "Alt and arrow keys to switch windows" })
vim.keymap.set("n", "<M-Down>", "<C-w><Down>", { desc = "Alt and arrow keys to switch windows" })
vim.keymap.set("n", "<M-Left>", "<C-w><Left>", { desc = "Alt and arrow keys to switch windows" })
vim.keymap.set("n", "<M-Right>", "<C-w><Right>", { desc = "Alt and arrow keys to switch windows" })
vim.keymap.set("x", "p", "pgvy") -- Keep the yank register the same after paste
vim.keymap.set({ "n" }, "<Home>", "^", { desc = "Go to beginning of line content" })
vim.keymap.set({ "i" }, "<Home>", "<C-o>^", { desc = "Go to beginning of line content" })
vim.keymap.set("n", "<C-b>", "<C-i>", { desc = "Go to definition" })
vim.keymap.set("n", "<C-v>", "<C-o>", { desc = "Go back" })
vim.keymap.set({ "c" }, "<C-e>", "<End>", { desc = "Go to end of line in insert mode" })
vim.keymap.set({ "c" }, "<C-a>", "<Home>", { desc = "Go to beginning of line in insert mode" })
vim.keymap.set({ "n" }, "<C-e>", "$", { desc = "Go to end of line in normal mode" })
vim.keymap.set({ "n" }, "<C-a>", "^", { desc = "Go to beginning of line in normal mode" })
vim.keymap.set({ "i" }, "<C-e>", "<Esc>A", { desc = "Go to end of line in insert mode" })
vim.keymap.set({ "i" }, "<C-a>", "<Esc>I", { desc = "Go to beginning of line in insert mode" })
vim.keymap.set({ "n" }, "l", "F", { desc = "Faster search backward on a line" })
vim.keymap.set({ "n" }, "<F1>", "<nop>")
-- vim.keymap.set({ "t" }, "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<S-Up>", ":m-2<cr>")
vim.keymap.set("n", "<S-Down>", ":m+<cr>")
vim.keymap.set("i", "<S-Up>", "<esc>:m-2<cr>")
vim.keymap.set("i", "<S-Down>", "<esc>:m+<cr>")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
