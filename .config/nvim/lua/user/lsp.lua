-- This file contains LSP (Language Server Protocol) configurations
-- Requires that you have nvim-lsp and nvim-cmp installed.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
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

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = 'buffer' },
        })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
    capabilities = capabilities
}
require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}
require('lspconfig')['bashls'].setup {
    capabilities = capabilities
}
require('lspconfig')['terraformls'].setup {
    capabilities = capabilities
}
require('lspconfig')['jsonls'].setup {
    capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}
require('lspconfig')['yamlls'].setup {
    capabilities = capabilities
}

-- -------------------------------------------------
-- Old configuration for COQ
-- local lsp = require "lspconfig"
-- vim.g.coq_settings = { auto_start = 'shut-up' }
-- local coq = require "coq"

-- lsp.pyright.setup(coq.lsp_ensure_capabilities())
-- lsp.gopls.setup(coq.lsp_ensure_capabilities())
-- lsp.bashls.setup(coq.lsp_ensure_capabilities())
-- lsp.terraformls.setup(coq.lsp_ensure_capabilities())
-- lsp.jsonls.setup(coq.lsp_ensure_capabilities())
-- lsp.tsserver.setup(coq.lsp_ensure_capabilities())
-- lsp.yamlls.setup(coq.lsp_ensure_capabilities())

-- Unused LSPs that you can enable if you download them.
-- require'lspconfig'.jsonls.setup{}
-- require'lspconfig'.yamlls.setup{}
-- require'lspconfig'.tsserver.setup{}
