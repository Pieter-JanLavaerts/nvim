vim.lsp.set_log_level('debug')
vim.lsp.start({
	name = 'haskell-language-server-wrapper',
	cmd = {'haskell-language-server-wrapper', '--lsp'},
	root_dir = vim.fs.dirname(vim.fs.find(function(name, path)
		return name:match('.*%.cabal$')
	end, { upward = true })[1]),
})
vim.treesitter.start()
