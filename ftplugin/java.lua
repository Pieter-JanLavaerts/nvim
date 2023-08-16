vim.lsp.set_log_level('debug')
project_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
project_name = vim.fs.basename(project_dir)
vim.lsp.start({
	name = 'jdtls',
	cmd = { 
		'jdtls',
		'-data', project_dir..'/../workspace/'..project_name
	},
	root_dir = project_dir
})
