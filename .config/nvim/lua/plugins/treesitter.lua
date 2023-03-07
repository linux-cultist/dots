local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"bash",
				"json",
				"markdown",
				"markdown_inline",
				"yaml",
				"vim",
				"python",
				"lua",
				"rust",
				"dockerfile",
				"terraform",
				"hcl",
			},
			auto_install = false, -- If this is true, it will install when browsing random files in FzfLua
			indent = { enable = true, disable = { "python" } },
			context_commentstring = { enable = true, enable_autocmd = false },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
		})
	end,
}

return M
