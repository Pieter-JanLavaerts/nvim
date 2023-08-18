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
end)

