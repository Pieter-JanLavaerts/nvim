vim.lsp.set_log_level('debug')
project_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true })[1])
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
vim.lsp.start({
	name = 'lua-language-server',
	cmd = { 
		'lua-language-server'
	},
	root_dir = project_dir,
	single_file_support = true,
	settings = { Lua = { telemetry = { enable = false } } }
})
