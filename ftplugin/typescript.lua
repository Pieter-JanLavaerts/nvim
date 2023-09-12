vim.lsp.set_log_level('debug')
local project_dir = vim.fs.dirname(vim.fs.find({'package.json', '.git'}, { upward = true })[1])
vim.lsp.start({
	name = 'typescript-language-server',
	cmd = {
		'typescript-language-server', '--stdio'
	},
	root_dir = project_dir
})
