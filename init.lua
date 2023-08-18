vim.o.cmdheight = 0
vim.opt.clipboard:append('unnamedplus')
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.g.mouse = 'a'
vim.keymap.set({'n', 'v'}, '<leader>/', "<cmd>noh<CR>", {})
local copy_filename = function()
    --local path = vim.fn.expand("%:t")
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.cmd("echo 'Copied " .. vim.fs.basename(path) .. " to the clipboard!'")
end
vim.keymap.set('n', '<leader>C', copy_filename, {})

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
		vim.keymap.set({'n', 'v'}, '<leader>e', vim.diagnostic.open_float, { buffer = args.buf })
	end
})
