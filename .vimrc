set nocompatible              " be iMproved, required
filetype off                  " required


syntax on

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
set undodir=~/.vim/undodir
set undofile
set incsearch

set nostartofline
set confirm
set mouse=a
set expandtab
set guicursor=


set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-dispatch'
"Plug '/home/mpaulson/personal/vim-apm'
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'

"Alternative for you complete me - commenting out because mac doesn't have
"popups
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "


noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>

"nerdtree 
map <leader>n :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>

"comment functions
map gc :call Comment()<CR>
map gC :call Uncomment()<CR>

"undo tree
noremap <leader>u :UndotreeShow<CR>

"Quick comment and uncomment of line functions

function! Comment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^/\#/
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^:\/\/:g
	elseif ft == 'tex'
		silent s:^:%:g
	elseif ft == 'vim'
		silent s:^:\":g
	endif
endfunction

function! Uncomment()
	let ft = &filetype
	if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' || ft == 'python' || ft == 'perl'
		silent s/^\#//
	elseif ft == 'javascript' || ft == 'c' || ft == 'cpp' || ft == 'java' || ft == 'objc' || ft == 'scala' || ft == 'go'
		silent s:^\/\/::g
	elseif ft == 'tex'
		silent s:^%::g
	elseif ft == 'vim'
		silent s:^\"::g
	endif
endfunction

"Fuzzy Finder
"This Only works on VIM 8.2+ with PopUp Windows.
"Currently Not upgrading MAC version of VIM to 8.2, but will work on my RHEL
"Machines
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
"let $FZF_DEFAULT_OPTS='--reverse'
"let g:fzf_branch_actions = {
"      \ 'rebase': {
"      \   'prompt': 'Rebase> ',
"      \   'execute': 'echo system("{git} rebase {branch}")',
"      \   'multiple': v:false,
"      \   'keymap': 'ctrl-r',
"      \   'required': ['branch'],
"      \   'confirm': v:false,
"      \ },
"      \ 'track': {
"      \   'prompt': 'Track> ',
"      \   'execute': 'echo system("{git} checkout --track {branch}")',
"      \   'multiple': v:false,
"      \   'keymap': 'ctrl-t',
"      \   'required': ['branch'],
"      \   'confirm': v:false,
"      \ },
"      \}
