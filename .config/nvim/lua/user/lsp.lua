require('lspconfig').pyright.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').bashls.setup{}
require('lspconfig').terraformls.setup{ filetypes = {"terraform", "hcl", "tf"}}
-- require'lspconfig'.jsonls.setup{}
-- require'lspconfig'.yamlls.setup{}
-- require'lspconfig'.tsserver.setup{}

