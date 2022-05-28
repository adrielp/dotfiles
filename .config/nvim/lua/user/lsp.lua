-- This file contains LSP (Language Server Protocol) configurations
-- Requires that you have nvim-lsp and coq-nvim installed.
local lsp = require "lspconfig"
vim.g.coq_settings = { auto_start = 'shut-up' }
local coq = require "coq"

lsp.pyright.setup(coq.lsp_ensure_capabilities())
lsp.gopls.setup(coq.lsp_ensure_capabilities())
lsp.bashls.setup(coq.lsp_ensure_capabilities())
lsp.terraformls.setup(coq.lsp_ensure_capabilities())

-- Unused LSPs that you can enable if you download them.
-- require'lspconfig'.jsonls.setup{}
-- require'lspconfig'.yamlls.setup{}
-- require'lspconfig'.tsserver.setup{}
