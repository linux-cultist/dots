local M = {
	"kdheepak/lazygit.nvim",
	event = "VeryLazy",
	enabled = true,
}

function M.config()
	vim.keymap.set("n", "<localleader>z", ":LazyGit<cr>", { desc = "LazyGit", silent = true })
end

return M
