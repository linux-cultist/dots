return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
	dev = true,
	enabled = true,
	config = true,
	event = "VeryLazy", -- This is only needed if you want to run :VenvSelect without keymappings
	opts = {
		-- path (optional) - Absolute path on the file system where the plugin will look for venvs.
		-- If you have venv folders in one specific path, you can set it here to look only in that path.
		-- If you have many venv folders spread out across the file system, dont set this at all, and the
		-- plugin will search for your venvs relative to what file is open in the current buffer.
		-- path = "/home/username/your_venvs"

		-- parents (optional) - How many parent directories the plugin will go up, before traversing down
		-- into all children directories to look for venvs. Set this to 0 if you use an absolute path above.
		-- parents = 2,

		-- name (optional) - The name of the venv directories to look for. Can for example be set to ".venv".
		-- name = "venv"
	},
	keys = { {
		"<localleader>v",
		"<cmd>VenvSelect<cr>",
	} },
}
