return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	dev = true,
	enabled = true,
	config = true,
	event = "VeryLazy", -- This is only needed if you want to run :VenvSelect without keymappings
	opts = {
		-- search_venv_managers = true,
		-- search_workspace = true,
		-- search = false,
		-- auto_refresh = true,
		-- name = { "venv" },
		-- auto_refresh = false,
		-- path (optional) - Absolute path on the file system where the plugin will look for venvs.
		-- If you have venv folders in one specific path, you can set it here to look only in that path.
		-- If you have many venv folders spread out across the file system, dont set this at all, and the
		-- plugin will search for your venvs relative to what file is open in the current buffer.
		-- path = "/home/username/your_venvs"
		-- parents (optional) - How many parent directories the plugin will go up, before traversing down
		-- into all children directories to look for venvs. Set this to 0 if you use an absolute path above.
		-- parents = 5,
		-- name (optional) - The name of the venv directories to look for. Can for example be set to ".venv".
		-- name = "venv"
		-- name = { "venv", ".venv" },
		-- search = false,
		-- auto_refresh = true,
		-- search_venv_managers = false,
		-- search_workspace = true,
		-- enable_debug_output = false,
	},
	keys = { {
		"<localleader>v",
		"<cmd>VenvSelect<cr>",
	} },
}
