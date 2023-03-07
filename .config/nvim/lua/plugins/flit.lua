local M = {
	"ggandor/flit.nvim",
	dependencies = { "ggandor/leap.nvim" },
	event = "VeryLazy",
	enabled = false,
}

function M.config()
	require("flit").setup({
		keys = { f = "f", F = "F", t = "t", T = "T" },
		-- A string like "nv", "nvo", "o", etc.
		labeled_modes = "v",
		multiline = true,
		-- Like `leap`s similar argument (call-specific overrides).
		-- E.g.: opts = { equivalence_classes = {} }
		opts = {},
	})
end

return M
