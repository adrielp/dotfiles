"      ______       ________
"     /__/\__\     |________|
"    /__/  \__\    |__|  |__|    Adriel Perkins
"   /__/____\__\   |________|    https://github.com/adrielp
"  /__/      \__\  |__|          https://adrielperkins.dev
" /__/        \__\ |__|          https://www.youtube.com/channel/UCMvC5sEUUx4U5CsM24Egmhg
" 

let mapleader = " "

syntax on

set shiftwidth=4
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nostartofline
set confirm
set expandtab
set guicursor=
set colorcolumn=80
set termguicolors
hi Cursor guifg=green guibg=green

highlight ColorColumn ctermbg=50 guibg=lightgreen


call plug#begin('~/.config/nvim/plugged')

Plug 'ambv/black'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-dispatch'
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'

call plug#end()

colorscheme gruvbox
set background=dark

noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>

inoremap <C-c> <esc>

"nerdtree 
map <leader>n :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>

"comment functions
map gc :call Comment()<CR>
map gC :call Uncomment()<CR>

"undo tree
noremap <leader>u :UndotreeShow<CR>

"quick clear of highlighting
"you can manually run the :let @/ = \"\" as an alternative
noremap <leader>C :let @/ = ""<CR>

"Quick comment and uncomment of line functions

function! Comment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl' || ft == 'yaml' || ft == 'yml' || ft == 'tmux'
		silent s/^/\#/
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^:\/\/:g
	elseif ft == 'jenkinsfile' || ft == 'groovy'
		silent s:^\/\/::g
	elseif ft == 'tex'
		silent s:^:%:g
	elseif ft == 'vim'
		silent s:^:\":g
	endif
endfunction

function! Uncomment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl' || ft == 'yaml' || ft == 'yml' || ft == 'tmux'
		silent s/^\#//
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^\/\/::g
	elseif ft == 'jenkinsfile' || ft == 'groovy'
		silent s:^\/\/::g
	elseif ft == 'tex'
		silent s:^%::g
	elseif ft == 'vim'
		silent s:^\"::g
	endif
endfunction
