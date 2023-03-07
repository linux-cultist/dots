local M = {}

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

M.lsp_signs = { Error = "✖ ", Warn = "! ", Hint = " ", Info = " " }

return M

-- local M = {}
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--
-- M.setup = function()
-- 	vim.diagnostic.config({
-- 		virtual_text = false,
-- 		float = {
-- 			focusable = false,
-- 			style = "minimal",
-- 			border = "rounded",
-- 			source = "always",
-- 			header = "",
-- 			prefix = "",
-- 		},
-- 		signs = true,
-- 		underline = true,
-- 		update_in_insert = true,
-- 		severity_sort = false,
-- 	})
--
-- 	---- sign column
-- 	local signs = require("utils").lsp_signs
--
-- 	for type, icon in pairs(signs) do
-- 		local hl = "DiagnosticSign" .. type
-- 		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- 	end
-- end
--
-- M.on_attach = function(client, bufnr)
-- 	local keymap_opts = { buffer = bufnr, silent = true, noremap = true }
--
-- 	vim.keymap.set("n", "<localleader>d", vim.diagnostic.open_float, keymap_opts)
-- 	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
--
-- 	vim.keymap.set("n", "<leader>d", function()
-- 		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
-- 	end, keymap_opts)
-- 	-- vim.keymap.set("n", "gd", function()
-- 	-- 	require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
-- 	-- end, keymap_opts)
-- 	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keymap_opts)
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
-- 	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
-- 	vim.keymap.set("n", "<leader>r", function()
-- 		require("fzf-lua").lsp_references({ jump_to_single_result = true, ignore_current_line = true })
-- 	end, keymap_opts)
-- 	-- vim.keymap.set("n", "gr", function()
-- 	-- 	require("fzf-lua").lsp_references({ jump_to_single_result = true, ignore_current_line = true })
-- 	-- end, keymap_opts)
--
-- 	vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
-- 	vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
-- 	vim.keymap.set("n", "<localleader>r", vim.lsp.buf.rename, keymap_opts)
-- 	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymap_opts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
-- 	-- vim.keymap.set("n", "<leader>gd", function()
-- 	-- 	require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
-- 	-- end, keymap_opts)
-- 	vim.keymap.set("n", "<leader>gD", "<cmd>FzfLua lsp_declarations<cr>", keymap_opts)
-- 	-- vim.keymap.set("n", "<leader>gr", function()
-- 	-- 	require("fzf-lua").lsp_references({ ignore_current_line = true })
-- 	-- end, keymap_opts)
-- 	vim.keymap.set("n", "<leader>gi", "<cmd>FzfLua lsp_implementations<cr>", keymap_opts)
-- 	-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, keymap_opts)
-- 	-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, keymap_opts)
-- 	-- vim.keymap.set("n", "<leader>wl", function()
-- 	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 	-- end, keymap_opts)
-- end
--
-- return M
