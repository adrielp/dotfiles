--       ______       ________
--      /__/\__\     |________|
--     /__/__\__\    |__|__|__|    Adriel Perkins
--    /__/____\__\   |________|    https://github.com/adrielp
--   /__/      \__\  |__|          https://adrielperkins.dev
--  /__/        \__\ |__|          https://www.youtube.com/channel/UCMvC5sEUUx4U5CsM24Egmhg
 
vim.g.mapleader = " "

require "user.plugins"
require "user.settings"
require "user.keymaps"
require "user.lsp"
require "user.treesitter"
require('nvim-autopairs').setup{}


-- Extras
-- require('telescope').load_extension('fzf')
-- require "user.nvim-cmp"
