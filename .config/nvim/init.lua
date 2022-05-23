--       ______       ________
--      /__/\__\     |________|
--     /__/  \__\    |__|  |__|    Adriel Perkins
--    /__/____\__\   |________|    https://github.com/adrielp
--   /__/      \__\  |__|          https://adrielperkins.dev
--  /__/        \__\ |__|          https://www.youtube.com/channel/UCMvC5sEUUx4U5CsM24Egmhg
 
vim.g.mapleader = " "

require "user.plugins"
require "user.settings"
require "user.keymaps"
require "user.lsp"
require('lspconfig').pyright.setup{on_attach=require'completion'.on_attach}
require('nvim-autopairs').setup{}
require "user.nvim-cmp"

-- if(vim.api.nvim_eval('exists("g:vscode")'))
-- then
--     require "user.vscode"
--     require "user.settings"
--     require "user.plugins"
-- else
--     require "user.plugins"
--     require "user.settings"
--     require "user.nvim-cmp"
--     require('nvim-autopairs').setup{}
--     require "user.lsp"
--     require('lspconfig').pyright.setup{on_attach=require'completion'.on_attach}
-- end

