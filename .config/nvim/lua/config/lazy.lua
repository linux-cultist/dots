vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- disable netrw at the very start of your init.lua (nvim tree recommends)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load lazy
require("lazy").setup("plugins", {
	install = { colorscheme = { "tokyonight" } },
	defaults = { lazy = true },
	checker = { enabled = true, notify = false },
	debug = false,
	dev = { path = "~/Code/Personal/plugins" },
	ui = { border = "rounded" },
})
