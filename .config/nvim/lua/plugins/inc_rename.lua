local M = {
	"smjonas/inc-rename.nvim",
}

function M.config()
	require("inc_rename").setup()
	vim.keymap.set('n', '<localleader>rn', ':IncRename ', { desc = "Incrementally rename", silent = true })

end

return M
