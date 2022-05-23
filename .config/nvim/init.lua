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
require "user.nvim-cmp"
require('lspconfig').pyright.setup{on_attach=require'completion'.on_attach}
require('nvim-autopairs').setup{}

-- if(vim.api.nvim_eval('exists("g:vscode")'))
-- then
--   --  require "user.vscode"
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


-- if(vim.g.vscode)
-- then
-- 	require "user.vscode"
-- else
-- end
-- 
-- lua <<EOF
--   -- Setup nvim-cmp.
--   local cmp = require'cmp'
-- 
--   cmp.setup({
--     snippet = {
--       -- REQUIRED - you must specify a snippet engine
--       expand = function(args)
--         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--       end,
--     },
--     window = {
--       -- completion = cmp.config.window.bordered(),
--       -- documentation = cmp.config.window.bordered(),
--     },
--     mapping = cmp.mapping.preset.insert({
--       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.abort(),
--       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     }),
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       { name = 'vsnip' }, -- For vsnip users.
--       -- { name = 'luasnip' }, -- For luasnip users.
--       -- { name = 'ultisnips' }, -- For ultisnips users.
--       -- { name = 'snippy' }, -- For snippy users.
--     }, {
--       { name = 'buffer' },
--     })
--   })
-- 
--   -- Set configuration for specific filetype.
--   cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--       { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--       { name = 'buffer' },
--     })
--   })
-- 
--   -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline('/', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'buffer' }
--     }
--   })
-- 
--   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     })
--   })
-- 
--   -- Setup lspconfig.
--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--   require('lspconfig')['pyright'].setup {
--     capabilities = capabilities
--   }
-- EOF
