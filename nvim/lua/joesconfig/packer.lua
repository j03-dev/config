vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'm4xshen/autoclose.nvim'

  use ({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})

  use {
      'neoclide/coc.nvim', tag = 'release'
  }

  use 'morhetz/gruvbox'
  use 'https://github.com/Mofiqul/vscode.nvim'
  use 'https://github.com/arzg/vim-colors-xcode'
  use 'folke/tokyonight.nvim'
  use 'https://github.com/NLKNguyen/papercolor-theme'
  use 'dracula/vim'


end)
