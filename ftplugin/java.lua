vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.lsp.set_log_level('debug')
local project_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'build.gradle'}, { upward = true })[1])
local project_name = vim.fs.basename(project_dir)
local lombok_location = vim.fs.normalize('~/.config/nvim/lombok.jar')
vim.lsp.start({
	name = 'jdtls',
	cmd = { 
		'jdtls',
		'--jvm-arg=-javaagent:'..lombok_location,
		'-data', project_dir..'/../workspace/'..project_name
	},
	root_dir = project_dir
})
