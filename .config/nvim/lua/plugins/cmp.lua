local M = {
	"hrsh7th/nvim-cmp",
	event = "BufReadPre",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-path" },
		-- { "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "saadparwaiz1/cmp_luasnip" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
	},

	opts = function()
		local cmp = require("cmp")
		-- local luasnip = require("luasnip")

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
						-- elseif luasnip.expand_or_jumpable() then
						-- 	luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
						-- elseif luasnip.jumpable(-1) then
						-- 	luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping.close(),
				["<C-k>"] = cmp.mapping.scroll_docs(-6),
				["<C-j>"] = cmp.mapping.scroll_docs(6),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp", keyword_length = 0 },
				{ name = "nvim_lsp_signature_help", keyword_length = 0 },
				-- { name = "nvim_lua", keyword_length = 0 },
				-- { name = "luasnip", keyword_length = 0 },
			},
			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
				border = "rounded",
				col_offset = 0,
				side_padding = 1,
				winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				-- zindex = 1001,
			},
			formatting = {
				-- changing the order of fields so the icon is the first
				fields = { "menu", "abbr", "kind" },

				-- here is where the change happens
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "λ",
						luasnip = "⋗",
						buffer = "Ω",
						path = "🖫",
						nvim_lua = "Π",
					}

					item.menu = menu_icon[entry.source.name]
					return item
				end,
			},
		})
	end,

	config = function(_, opts)
		local cmp = require("cmp")
		cmp.setup(opts)
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}

return M
