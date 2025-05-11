-- vim.lsp.on_attach(function(client, bufnr)
--   vim.lsp.default_keymaps({buffer = bufnr})
-- end)
-- vim.lsp.setup()

-- LSP Specific Keymaps
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

-- custom registrations
local wk = require("which-key")
wk.add({
    { "<leader>K", vim.lsp.buf.hover, desc = "Buff Hover", prefix = "<leader>"},
    { "<leader>gd", vim.lsp.buf.definition, desc = "Go to definition" },
    { "<leader>vca", vim.lsp.buf.code_action, desc = "Code Action" },
    { "<leader>vd", vim.diagnostic.open_float, desc = "Diagnostic Open Float" },
    { "<leader>vrn", vim.lsp.buf.rename, desc = "LSP Rename" },
    { "<leader>vrr", vim.lsp.buf.references, desc = "LSP References" },
    { "<leader>vws", vim.lsp.buf.workspace_symbol, desc = "Workspace Symbol" },
    { "<leader><C-h>", vim.lsp.buf.signature_help, desc = "Signature Help" },
})

require('lsps.luals')
require('lsps.gopls')
