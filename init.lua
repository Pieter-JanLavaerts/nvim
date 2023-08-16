vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.hoverProvider then
			vim.keymap.set({'n', 'v'}, 'K', vim.lsp.buf.hover, { buffer = args.buf })
		end
		if client.server_capabilities.codeActionProvider then
			vim.keymap.set({'n', 'v'}, 'ga', vim.lsp.buf.code_action, { buffer = args.buf })
		end
		if client.server_capabilities.referencesProvider then
			vim.keymap.set({'n', 'v'}, 'gr', vim.lsp.buf.references, { buffer = args.buf })
		end
		if client.server_capabilities.definitionProvider then
			vim.keymap.set({'n', 'v'}, 'gd', vim.lsp.buf.definition, { buffer = args.buf })
		end
		if client.server_capabilities.declarationProvider then
			vim.keymap.set({'n', 'v'}, 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
		end
	end
})
