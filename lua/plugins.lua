return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-sensible'
	use 'tpope/vim-abolish'
	use 'ellisonleao/gruvbox.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-tree/nvim-web-devicons', opt = true
		}
	}
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-telescope/telescope-fzf-native.nvim', run = 'make'
		}
	}
	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require'hop'.setup {
				keys = 'uhetonasidgp.ckb',
				quit_key = '<SPC>',
				multi_windows = true
			}
		end
	}
	use {
		'AckslD/nvim-neoclip.lua',
		requires = {
			{'nvim-telescope/telescope.nvim'}
		}
	}
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
	}
	use {
		'folke/which-key.nvim',
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require('which-key').setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use 'ThePrimeagen/harpoon'
	use {
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	}
end)

