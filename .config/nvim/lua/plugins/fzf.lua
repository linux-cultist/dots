local M = {
	"ibhagwan/fzf-lua",
	event = "VeryLazy",
	config = function()
		require("fzf-lua").setup({
			-- files = {
			-- 	fd_opts = "--color=never --type f --hidden --follow --exclude .git --search-path ~/Code --search-path ~/.config",
			-- },
			-- fzf_opts = {
			-- 	-- options are sent as `<left>=<right>`
			-- 	-- set to `false` to remove a flag
			-- 	-- set to '' for a non-value flag
			-- 	-- for raw args use `fzf_args` instead
			-- 	["--ansi"] = "",
			-- 	["--info"] = "inline",
			-- 	["--height"] = "100%",
			-- 	["--layout"] = "reverse",
			-- 	["--border"] = "none",
			-- },
		})
	end,
	keys = {
		{ "<leader>t", "<cmd>FzfLua tabs<cr>",            desc = "Switch tabs" },
		{ "<leader>c", "<cmd>FzfLua command_history<cr>", desc = "Command Line History" },
		{
			"<leader><leader>",
			"<cmd>FzfLua oldfiles<cr>",
			desc = "Show Recent Files",
			silent = true,
		},
		{
			"<localleader><leader>",
			"<cmd>FzfLua buffers<cr>",
			desc = "List Buffers",
			silent = true,
		},
		{
			"<leader>g",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Grep word",
			silent = true,
		},
{
			"<leader>G",
			function()
				require("fzf-lua").live_grep_native({ cwd = "~" })
			end,
			desc = "Grep in Home",
			silent = true,
		},
		{
			"<localleader>g",
			-- "<cmd>FzfLua live_grep %:p:h<cr>",
			function()
				require("fzf-lua").live_grep_native()
			end,
			desc = "Grep in Workspace",
			silent = true,
		},
		{
			"<localleader>F",
			function()
				require("fzf-lua").files({ cwd = "~" })
			end,
			desc = "Fuzzy Find in Home",
			silent = true,
		},
		{
			"<localleader>f",
			function()
				-- fzf.files({ cwd = "%:p:h" }) -- Will use project directory from Project plugin
				require("fzf-lua").files()
			end,
			desc = "Fuzzy Find in Workspace",
			silent = true,
		},
		{ "<leader>h", "<cmd>FzfLua help_tags<cr>",         desc = "Neovim Help",              silent = true },
		{ "<leader>w", ":FzfLua diagnostics_workspace<cr>", desc = "Diagnostics in Workspace", silent = true },
		{
			"<localleader>d",
			"<cmd>FzfLua diagnostics_document<cr>",
			desc = "Diagnostics in Document",
			silent = true,
		},
		-- -- vim.keymap.set("n", "<localleader>G", ":FzfLua grep_curbuf<cr>", { desc = "Grep in Buffer", silent = true })
		-- { "<localleader>k", "<cmd>FzfLua keymaps<cr>",    desc = "List keymaps",    silent = true },
		-- { "<localleader>r", ":FzfLua registers<cr>",      desc = "List registers",  silent = true },
		-- { "<C-q>",          ":FzfLua lsp_references<cr>", desc = "List references", silent = true },
	},
}

return M
