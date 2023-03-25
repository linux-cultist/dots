return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	-- event = { "VeryLazy" },
	dependencies = {
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		servers = {
			-- Add specific language server config here if needed
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		},
	},
	config = function(_, opts)
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		local lspconfig = require("lspconfig")
		local mlsp = require("mason-lspconfig")
		local ensure_installed = {}

		for server, server_opts in pairs(opts.servers) do
			if server_opts then
				server_opts = server_opts == true and {} or server_opts
				ensure_installed[#ensure_installed + 1] = server
			end
		end

		local function setup(server)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
			}, opts.servers[server] or {})

			lspconfig[server].setup(server_opts)
		end

		mlsp.setup({ ensure_installed = ensure_installed })
		mlsp.setup_handlers({ setup })

		require("utils").on_attach(function(client, bufnr)
			-- print("Attaching keymaps to client '" .. client["name"] .. "'")
			-- print(vim.inspect(client))
			local keymap_opts = { buffer = bufnr, silent = true, noremap = true }

			vim.keymap.set("n", "<localleader>d", vim.diagnostic.open_float, keymap_opts)
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)

			vim.keymap.set("n", "<leader>d", function()
				require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
			end, keymap_opts)
			-- vim.keymap.set("n", "gd", function()
			-- 	require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
			-- end, keymap_opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
			vim.keymap.set("n", "<leader>r", function()
				require("fzf-lua").lsp_references({ jump_to_single_result = true, ignore_current_line = true })
			end, keymap_opts)
			-- vim.keymap.set("n", "gr", function()
			-- 	require("fzf-lua").lsp_references({ jump_to_single_result = true, ignore_current_line = true })
			-- end, keymap_opts)

			vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
			vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
			vim.keymap.set("n", "<localleader>r", vim.lsp.buf.rename, keymap_opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymap_opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
			-- vim.keymap.set("n", "<leader>gd", function()
			-- 	require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
			-- end, keymap_opts)
			vim.keymap.set("n", "<leader>gD", "<cmd>FzfLua lsp_declarations<cr>", keymap_opts)
			-- vim.keymap.set("n", "<leader>gr", function()
			-- 	require("fzf-lua").lsp_references({ ignore_current_line = true })
			-- end, keymap_opts)
			vim.keymap.set("n", "<leader>gi", "<cmd>FzfLua lsp_implementations<cr>", keymap_opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, keymap_opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, keymap_opts)
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, keymap_opts)
		end)

		local rt = require("rust-tools")
		rt.setup({
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
			tools = {
				-- Rust tools parameters
				hover_actions = {
					auto_focus = false,
					max_width = 150,
					max_height = 100,
				},
				inlay_hints = {
					auto = true,
					show_parameter_hints = false,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
				cargo = {
					loadOutDirsFromCheck = true,
					buildScripts = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
				},
			},
		})

		-- Diagnostics stuff below , can be moved somewhere else

		vim.diagnostic.config({
			virtual_text = false,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = false,
		})

		---- sign column
		local signs = require("utils").lsp_signs

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- End of diagnostic stuff above
	end,
}

-- local utils = require("utils")
-- local mason_lspconfig = require("mason-lspconfig")
-- local lspconfig = require("lspconfig")
-- local lsp_utils = require("plugins.lsp.lsp-utils")
-- local rt = require("rust-tools")
-- local lsp = vim.lsp
--
-- lsp_utils.setup()
--
-- mason_lspconfig.setup({
-- 	ensure_installed = utils.lsp_servers,
-- })
--
-- local default_handler = function(server_name)
-- 	print("default handler called")
-- 	lspconfig[server_name].setup({
-- 		on_attach = lsp_utils.on_attach,
-- 		capabilities = lsp_utils.capabilities,
-- 	})
-- end

-- mason_lspconfig.setup_handlers({
-- 	-- The below function is called by default for lsp servers that dont
-- 	-- have their own definition below (sumneko_lua, pyright and so on).
-- 	default_handler,
-- 		["rust_analyzer"] = function()
-- 		rt.setup({
-- 			tools = {
-- 				cargo = {
-- 					buildScripts = {
-- 						enable = true,
-- 					},
-- 				},
-- 				procMacro = {
-- 					enable = true,
-- 				},
-- 				hover_actions = {
-- 					auto_focus = false,
-- 					max_width = 150,
-- 					max_height = 100,
-- 				},
-- 				inlay_hints = {
-- 					auto = true,
-- 					show_parameter_hints = false,
-- 					parameter_hints_prefix = "",
-- 					other_hints_prefix = "",
-- 				},
-- 			},
-- 			server = {
-- 				on_attach = function(client, bufnr)
-- 					lsp_utils.on_attach(client, bufnr)
-- 					-- Below should replace some keymaps with Rust Tools versions
-- 					vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
-- 					vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
-- 				end,
-- 			},
-- 		})
-- 	end,
-- 		["lua_ls"] = function()
-- 		lspconfig.lua_ls.setup({
-- 			on_attach = lsp_utils.on_attach,
-- 			capabilities = lsp_utils.capabilities,
-- 			settings = {
-- 				Lua = {
-- 					runtime = { version = "LuaJIT" },
-- 					diagnostics = { globals = { "vim" } },
-- 					workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
-- 				},
-- 			},
-- 		})
-- 	end,
-- 		["csharp_ls"] = function()
-- 		lspconfig.csharp_ls.setup({
-- 			on_attach = lsp_utils.on_attach,
-- 			capabilities = lsp_utils.capabilities,
-- 		})
-- 	end,
-- 		["pyright"] = function()
-- 		print("attaching pyright")
-- 		lspconfig.pyright.setup({
-- 			on_attach = lsp_utils.on_attach,
-- 			capabilities = lsp_utils.capabilities,
-- 			settings = {
-- 				pyright = {
-- 					disableOrganizeImports = false,
-- 					analysis = {
-- 						useLibraryCodeForTypes = true,
-- 						autoSearchPaths = true,
-- 						diagnosticMode = "workspace",
-- 						autoImportCompletions = true,
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- })

-- lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
-- 	border = "rounded",
-- })
-- 	end,
-- }
--
-- return M
