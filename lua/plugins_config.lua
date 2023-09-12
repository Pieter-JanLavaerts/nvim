vim.o.background = 'dark' -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local lualine = require('lualine')
local lualine_config = lualine.get_config()
lualine_config.options.theme = 'gruvbox'
lualine.setup(lualine_config)

require('telescope').setup({
	defaults = {
		path_display={'truncate'},
		extensions = {
			file_browser = {
				theme = 'gruvbox',
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true
			},
		}
	}
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_utils = require("telescope.utils")

require('hop').setup()

require('telescope').load_extension('neoclip')
require('neoclip').setup({
	history = 1000,
	enable_persistent_history = false,
	length_limit = 1048576,
	continuous_sync = false,
	db_path = vim.fn.stdpath('data') .. '/databases/neoclip.sqlite3',
	filter = nil,
	preview = true,
	prompt = nil,
	default_register = '"',
	default_register_macros = 'q',
	enable_macro_history = true,
	content_spec_column = false,
	disable_keycodes_parsing = false,
	on_select = {
		move_to_front = false,
		close_telescope = true,
	},
	on_paste = {
		set_reg = false,
		move_to_front = false,
		close_telescope = true,
	},
	on_replay = {
		set_reg = false,
		move_to_front = false,
		close_telescope = true,
	},
	on_custom_action = {
		close_telescope = true,
	},
	keys = {
		telescope = {
			i = {
				select = '<cr>',
				paste = '<c-p>',
				paste_behind = '<c-k>',
				replay = '<c-q>',  -- replay a macro
				delete = '<c-d>',  -- delete an entry
				edit = '<c-e>',  -- edit an entry
				custom = {},
			},
			n = {
				select = '<cr>',
				paste = 'p',
				--- It is possible to map to more than one key.
				-- paste = { 'p', '<c-p>' },
				paste_behind = 'P',
				replay = 'q',
				delete = 'd',
				edit = 'e',
				custom = {},
			},
		},
		fzf = {
			select = 'default',
			paste = 'ctrl-p',
			paste_behind = 'ctrl-k',
			custom = {},
		},
	},
})

local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require("harpoon.ui")
require('telescope').load_extension('harpoon')

local wk = require('which-key')

wk.register({
  f = {
    name = 'Telescope',
    f = { telescope_builtin.find_files, 'Find File' },
    -- F = { function() telescope_builtin.find_files({ cwd = telescope_utils.buffer_dir() }) end, 'Find File from buffer dir'},
    g = { telescope_builtin.live_grep, 'Grep' },
    b = { telescope_builtin.buffers, 'Buffers' },
    h = { telescope_builtin.help_tags, 'Help tags' },
    c = { telescope.extensions.neoclip.default, 'Clipboard manager' },
    e = { ':Telescope harpoon marks<CR>' , 'Harpoon' },
    d = { ':Telescope file_browser path=%:p:h select_buffer=true<CR>', 'File browser %' },
    D = { ':Telescope file_browser<CR>', 'File browser .' },
  },
  w = { '<cmd>HopWord<CR>', 'Hop word'},
  F = { '<cmd>HopChar1<CR>', 'Hop char'},
  h = {
    name = 'Harpoon',
    m = { harpoon_mark.add_file, 'Mark file' },
    i = { harpoon_ui.toggle_quick_menu, 'Toggle menu' },
    n = { harpoon_ui.nav_next, 'Nav next' },
    p = { harpoon_ui.nav_prev, 'Nav prev' },
    u = { function() harpoon_ui.nav_file(1) end, 'Nav 1' },
    e = { function() harpoon_ui.nav_file(2) end, 'Nav 2' },
    o = { function() harpoon_ui.nav_file(3) end, 'Nav 3' },
    a = { function() harpoon_ui.nav_file(4) end, 'Nav 4' }
  }
}, { prefix = '<leader>' })

local ls = require('luasnip')
require("luasnip.loaders.from_snipmate").lazy_load()
vim.keymap.set({"i"}, "<C-k>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-n>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-p>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-e>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
