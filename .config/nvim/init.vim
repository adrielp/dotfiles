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
set expandtab
set smartindent
set nu
set rnu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nostartofline
set confirm
set guicursor=
set colorcolumn=80
set termguicolors
set list

call plug#begin('~/.config/nvim/plugged')

Plug 'ambv/black'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'windwp/nvim-autopairs'
Plug 'bfredl/nvim-ipy'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'tomlion/vim-solidity'
Plug 'vim-airline/vim-airline-themes'
"Plug 'stsewd/fzf-checkout.vim'
call plug#end()

" AutoPairs
lua require('nvim-autopairs').setup{}

" LSP Installs
lua require'lspconfig'.pyright.setup{}
" lua require'lspconfig'.bashls.setup{}
" lua require'lspconfig'.jsonls.setup{}
" lua require'lspconfig'.yamlls.setup{}
" lua require'lspconfig'.tsserver.setup{}

" nvim-completion configuration
lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}

" Set completelopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

" LSP Basic Configuration 
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Telescope remaps
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>



let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark
" Set transparent background for VIM
hi Normal guibg=NONE ctermbg=NONE

noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>sp :set paste!<CR>

inoremap <C-c> <esc>

"nerdtree
map <leader>n :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>
" enabled line numbers in nerd tree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal rnu nu

"undo tree
noremap <leader>u :UndotreeShow<CR>

"quick clear of highlighting
"you can manually run the :let @/ = \"\" as an alternative
noremap <leader>C :let @/ = ""<CR>

" escaping out of a terminal
tnoremap <Esc> <c-\><C-n>

" nvim-cmp configuration
" set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['pyright'].setup {
  --   capabilities = capabilities
  -- }
EOF
