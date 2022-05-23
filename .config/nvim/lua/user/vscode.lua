local Plug = vim.fn['plug#']

home = os.getenv("HOME")

vim.call('plug#begin', home .. '/.config/nvim/plugged')
-- Plug('asvertliakov/vim-easymotion', {as = 'vsc-easymotion'})
-- Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
-- Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})  -- We recommend updating the parsers on update
vim.call('plug#end')
