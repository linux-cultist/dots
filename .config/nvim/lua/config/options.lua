-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","
-- vim.g.tmux_navigator_no_mappings = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = false -- Use relativenumber
vim.opt.signcolumn = "yes"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.timeoutlen = 1000
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.textwidth = 120
-- vim.o.sessionoptions = "buffers,curdir,folds,help,terminal,options"
vim.o.title = true
vim.o.titlestring = true
vim.o.laststatus = 3
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

vim.o.breakindent = true -- Enable break indent
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect" -- Set completeopt to have a better completion experiense
vim.o.hlsearch = false -- Set highlight on search
vim.o.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.mouse = "a" -- Enable mouse mode
vim.o.smartcase = true -- Case insensitive searching UNLESS /C or capital in search
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true -- Make sure to use all colors in terminal
vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250 -- Decrease update time
vim.o.winbar="%f"
vim.o.winblend=20
vim.o.pumblend=20

-- vim.opt.guifont = "JetbrainsMono Nerd Font:h12"

-- Check if neovim-qt is loaded, needs neovim shim plugin
if vim.g.GuiLoaded then
	vim.opt.guifont = "JetbrainsMono Nerd Font:h13"
	-- vim.opt.laststatus = 0 -- Disable statusline when using graphical client since it looks cleaner
	-- vim.opt.guifont = "IBM Plex Mono:h13"
	-- vim.opt.guifont = "FiraCode Nerd Font Mono:h13"
	-- vim.opt.cmdheight = 0
end

-- vim.cmd[[set highlight WinSeparator guifg=orange]]


if vim.g.neovide then
	vim.opt.guifont = { "JetbrainsMono_Nerd_Font", ":h12" }
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.laststatus = 0
	vim.o.mouse = "" -- Disable mouse in Neovide since terminal selection gets messed update_package
	vim.opt.cursorline = false
	-- vim.opt.winblend = 10
	-- vim.opt.pumblend = 10
	vim.cmd([[
		" let g:neovide_font_edging = 'subpixelantialias'
		" let g:neovide_font_hinting = 'none'
		" let g:neovide_hide_mouse_when_typing = v:true
		" let g:neovide_scroll_animation_length = 0.3 " This needs multigrid and is very buggy when using terminal and listing long output.
		" let g:neovide_cursor_vfx_mode = "ripple"
		" let g:neovide_cursor_animation_length = 0
		" let g:neovide_cursor_animate_command_line = false
		" let g:neovide_transparency = 1.0
	]])
end
