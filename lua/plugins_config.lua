vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local lualine = require('lualine')
local lualine_config = lualine.get_config()
lualine_config.options.theme = 'gruvbox'
lualine.setup(lualine_config)

require('telescope').setup{
	defaults = {
		path_display={"truncate"}
	}
}
require('telescope').load_extension('fzf')
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

require('hop').setup()
vim.keymap.set({'n', 'v'}, '<leader>w', '<cmd>HopWord<CR>')
vim.keymap.set({'n', 'v'}, '<leader>h', '<cmd>HopChar1<CR>')
