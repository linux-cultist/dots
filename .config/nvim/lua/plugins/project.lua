local M = {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	enabled = true,
	config = function()
		require("project_nvim").setup({
			detection_methods = { "pattern", "lsp" },
			patterns = { "venv", "Cargo.toml", ".git" },
			show_hidden = true,
			silent_chdir = true,
			exclude_dirs = { "~" },
			scope_chdir = "global",
		})
		require("telescope").load_extension("projects")
		vim.keymap.set("n", "<leader><enter>", ":Telescope projects<cr>")
	end,
}

return M
