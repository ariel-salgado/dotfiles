vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- defaults:
		-- https://neovim.io/doc/user/news-0.11.html#_defaults

		map("<leader>df", vim.diagnostic.open_float, "Open Diagnostic Float")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>gs", vim.lsp.buf.signature_help, "Signature Documentation")
		map("<leader>gd", vim.lsp.buf.declaration, "Goto Declaration")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		-- map("<leader>rr", vim.lsp.buf.rename, "Rename all references")
		-- map("<leader>lf", vim.lsp.buf.format, "Format")
		-- map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

			-- When cursor stops moving: Highlights all instances of the symbol under the cursor
			-- When cursor moves: Clears the highlighting
			-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			-- 	buffer = event.buf,
			-- 	group = highlight_augroup,
			-- 	callback = vim.lsp.buf.document_highlight,
			-- })
			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			-- When LSP detaches: Clears the highlighting
			vim.api.nvim_create_autocmd('LspDetach', {
				group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
				end,
			})
		end
	end,

})
