return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	config = true,
	opts = function()
		local nls = require("null-ls")
		return {
			sources = {
				nls.builtins.formatting.black.with({ extra_args = { "--line-length", "119" } }),
				nls.builtins.diagnostics.ruff.with({ extra_args = { "--line-length", "119" } }),
				nls.builtins.formatting.fish_indent,
				nls.builtins.diagnostics.fish,
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.shfmt,
				nls.builtins.formatting.terraform_fmt,
			},
		}
	end,
}
