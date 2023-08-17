vim.lsp.set_log_level('debug')
project_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
project_name = vim.fs.basename(project_dir)
lombok_location = vim.fs.normalize('~/.config/nvim/lombok.jar')
vim.lsp.start({
	name = 'jdtls',
	cmd = { 
		'jdtls',
		'--jvm-arg=-javaagent:'..lombok_location,
		'-data', project_dir..'/../workspace/'..project_name
	},
	root_dir = project_dir
})
