vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.bo.expandtab = true
vim.lsp.set_log_level('debug')
project_dir = vim.fs.dirname(vim.fs.find(function(name, path)
	return name:match('.*~.cabal$') or name == 'stack.yaml'
end, { upward = true })[1])
vim.lsp.start({
	name = 'haskell-language-server-wrapper',
	cmd = {'haskell-language-server-wrapper', '--lsp'},
	root_dir = vim.fs.dirname(vim.fs.find(function(name, path)
		return name:match('.*%.cabal$')
	end, { upward = true })[1]),
})
vim.treesitter.start()
