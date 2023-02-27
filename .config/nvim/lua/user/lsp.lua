-- This file contains LSP (Language Server Protocol) configurations
--

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
    'pyright',
    'gopls',
    'bashls',
    'terraformls',
    'jsonls',
    'yamlls'

})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  -- Old LSP Remaps
  -- keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  -- keymap("n", "K","<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  -- keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  -- keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  -- keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
  -- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  -- keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
  -- keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
  -- keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

--require('lspconfig')['pyright'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['gopls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['bashls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['terraformls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['jsonls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['tsserver'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['yamlls'].setup {
--    capabilities = capabilities
--}
-- Requires that you have nvim-lsp and nvim-cmp installed.
--local cmp = require'cmp'
--
--cmp.setup({
--    snippet = {
--        -- REQUIRED - you must specify a snippet engine
--        expand = function(args)
--            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--        end,
--    },
--    window = {
--        -- completion = cmp.config.window.bordered(),
--        -- documentation = cmp.config.window.bordered(),
--    },
--    mapping = cmp.mapping.preset.insert({
--            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--            ['<C-f>'] = cmp.mapping.scroll_docs(4),
--            ['<C-Space>'] = cmp.mapping.complete(),
--            ['<C-e>'] = cmp.mapping.abort(),
--            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--        }),
--    sources = cmp.config.sources({
--            { name = 'nvim_lsp' },
--            { name = 'vsnip' }, -- For vsnip users.
--            -- { name = 'luasnip' }, -- For luasnip users.
--            -- { name = 'ultisnips' }, -- For ultisnips users.
--            -- { name = 'snippy' }, -- For snippy users.
--        }, {
--            { name = 'buffer' },
--        })
--})
--
---- Set configuration for specific filetype.
--cmp.setup.filetype('gitcommit', {
--    sources = cmp.config.sources({
--        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--        }, {
--            { name = 'buffer' },
--        })
--})
--
---- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline({ '/', '?' }, {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--        { name = 'buffer' }
--    }
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--        mapping = cmp.mapping.preset.cmdline(),
--        sources = cmp.config.sources({
--                { name = 'path' }
--            }, {
--                { name = 'cmdline' }
--            })
--})
--
---- Set up lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['pyright'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['gopls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['bashls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['terraformls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['jsonls'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['tsserver'].setup {
--    capabilities = capabilities
--}
--require('lspconfig')['yamlls'].setup {
--    capabilities = capabilities
--}

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
