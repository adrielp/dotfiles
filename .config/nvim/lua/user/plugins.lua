-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Essentials
  use('tpope/vim-fugitive')
  use('mbbill/undotree')
  use('windwp/nvim-autopairs')
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Optionals
  use("github/copilot.vim")
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end
  })
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')

end)

-- Old Vim Plugged
-- local Plug = vim.fn['plug#']
-- home = os.getenv("HOME")
--vim.call('plug#begin', home .. '/.config/nvim/plugged')
--Plug 'psf/black' -- Python Black auto formatter: https://github.com/psf/black/blob/main/plugin/black.vim
--Plug 'neovim/nvim-lspconfig' -- NeoVim LSP Plugin: https://github.com/neovim/nvim-lspconfig
--Plug 'tweekmonster/gofmt.vim' -- Automatic go formatter: https://github.com/tweekmonster/gofmt.vim
--Plug 'tpope/vim-fugitive' -- Vim plugin for Git: https://github.com/tpope/vim-fugitive
--Plug 'mbbill/undotree' -- Shows an undo tree: https://github.com/mbbill/undotree
--Plug 'sheerun/vim-polyglot' -- Vim language packs: https://github.com/sheerun/vim-polyglot
--Plug 'tpope/vim-dispatch' -- "Dispatches" compiler plugins: https://github.com/tpope/vim-dispatch
--Plug 'joshdick/onedark.vim' -- One Dark color theme: https://github.com/joshdick/onedark.vim
--Plug 'nvim-lua/popup.nvim' -- Api for popups: https://github.com/nvim-lua/popup.nvim
--Plug 'nvim-lua/plenary.nvim' -- Required by pop.nvim
--Plug 'nvim-telescope/telescope.nvim' -- Awesome fuzzy finder: https://github.com/nvim-telescope/telescope.nvim
--Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- We recommend updating the parsers on update
--Plug 'windwp/nvim-autopairs' -- Automatically completes pairs and integrates with coq_vim: https://github.com/windwp/nvim-autopairs
--Plug 'vim-airline/vim-airline' -- Status line for VIM: https://github.com/vim-airline/vim-airline
--Plug 'vim-airline/vim-airline-themes' -- Themes for the above
--Plug 'rust-lang/rust.vim' -- Rust file detection and syntax highlighting: https://github.com/rust-lang/rust.vim
--Plug 'tomlion/vim-solidity' -- Syntax for solidity: https://github.com/tomlion/vim-solidity
