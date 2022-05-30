local Plug = vim.fn['plug#']

home = os.getenv("HOME")

vim.call('plug#begin', home .. '/.config/nvim/plugged')

Plug 'psf/black' -- Python Black auto formatter: https://github.com/psf/black/blob/main/plugin/black.vim
Plug 'neovim/nvim-lspconfig' -- NeoVim LSP Plugin: https://github.com/neovim/nvim-lspconfig
Plug ('ms-jpq/coq_nvim', {branch = 'coq'}) -- Coq.nvim auto completer
Plug ('ms-jpq/coq.artifacts', {branch = 'coq'}) -- Coq.nvim snippets
Plug 'tweekmonster/gofmt.vim' -- Automatic go formatter: https://github.com/tweekmonster/gofmt.vim
Plug 'tpope/vim-fugitive' -- Vim plugin for Git: https://github.com/tpope/vim-fugitive
Plug 'mbbill/undotree' -- Shows an undo tree: https://github.com/mbbill/undotree
Plug 'sheerun/vim-polyglot' -- Vim language packs: https://github.com/sheerun/vim-polyglot
Plug 'tpope/vim-dispatch' -- "Dispatches" compiler plugins: https://github.com/tpope/vim-dispatch
Plug 'joshdick/onedark.vim' -- One Dark color theme: https://github.com/joshdick/onedark.vim
Plug 'nvim-lua/popup.nvim' -- Api for popups: https://github.com/nvim-lua/popup.nvim
Plug 'nvim-lua/plenary.nvim' -- Required by pop.nvim
Plug 'nvim-telescope/telescope.nvim' -- Awesome fuzzy finder: https://github.com/nvim-telescope/telescope.nvim
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- We recommend updating the parsers on update
Plug 'windwp/nvim-autopairs' -- Automatically completes pairs and integrates with coq_vim: https://github.com/windwp/nvim-autopairs
Plug 'vim-airline/vim-airline' -- Status line for VIM: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes' -- Themes for the above
Plug 'rust-lang/rust.vim' -- Rust file detection and syntax highlighting: https://github.com/rust-lang/rust.vim
Plug 'tomlion/vim-solidity' -- Syntax for solidity: https://github.com/tomlion/vim-solidity
Plug 'kyazdani42/nvim-tree.lua' -- Filetree explorer for Vim: https://github.com/kyazdani42/nvim-tree
Plug 'kyazdani42/nvim-web-devicons' -- Required by nvim-tree to be able to show folders

-- Unused plugins that you may want to enable.
-- ------------------------------------------
-- Plug ('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }) -- Telescope addon that improves performance: https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- Plug 'vim-utils/vim-man' -- Man pages in Vim: https://github.com/vim-utils/vim-man
-- Plug 'gruvbox-community/gruvbox' -- gruvbox colortheme: https://github.com/gruvbox-community/gruvbox
-- Plug 'preservim/nerdtree' -- Filetree explorer replaces netrw: https://github.com/preservim/nerdtree
-- Plug 'jupyter-vim/jupyter-vim' -- Juptyer frontend for Vim that's actively maintained: https://github.com/jupyter-vim/jupyter-vim
-- Plug 'bfredl/nvim-ipy' -- Jupyter frontend for NeoVim: https://github.com/bfredl/nvim-ipy
-- Plug 'tjdevries/nlua.nvim' -- Lua Development for NeoVim: https://github.com/tjdevries/nlua.nvim
-- Plug 'nvim-lua/lsp_extensions.nvim' -- Extensions for build-in LSP: https://github.com/nvim-lua/lsp_extensions.nvim
vim.call('plug#end')
