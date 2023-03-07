local M = {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	opts = {
		ensure_installed = {
			"bash-language-server",
			"black",
			"csharp-language-server",
			"yaml-language-server",
			"dockerfile-language-server",
			"pyright",
			"prettier",
			"rust-analyzer",
			"markdownlint",
			"stylua",
			"shfmt",
			"ruff",
			"terraform-ls",
			"tflint",
		},
		pip = {
			upgrade_pip = true,
		},
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	keys = {
		{ "<localleader>m", "<cmd>Mason<cr>", desc = "Mason" },
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}

return M
