vim.lsp.set_log_level('debug')
local project_dir = vim.fs.dirname(vim.fs.find({'mix.esx', '.git'}, { upward = true })[1])
vim.lsp.start({
	name = 'elixir-ls',
	cmd = {
		'elixir-ls',
	},
	root_dir = project_dir
})
