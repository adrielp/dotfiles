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

-- Add this to your Neovim configuration (init.lua or wherever you configure LSP)

-- Configure diagnostic display
vim.diagnostic.config({
  virtual_text = {
    -- Display diagnostics as virtual text on the right side
    source = "always",  -- Or "if_many" to show source only if multiple sources
    prefix = "●",       -- Could be '■', '▎', 'x', '!'
    spacing = 4,        -- Spacing between code and virtual text
    format = function(diagnostic)
      -- Format the diagnostic message
      if diagnostic.source then
        return string.format("%s: %s", diagnostic.source, diagnostic.message)
      end
      return diagnostic.message
    end,
  },
  signs = true,         -- Keep the signs in the gutter
  underline = true,     -- Underline the problematic code
  update_in_insert = false,  -- Don't update diagnostics in insert mode
  severity_sort = true, -- Sort by severity
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Optional: Customize the diagnostic signs in the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Optional: Set up keymaps for diagnostic navigation
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Optional: Customize diagnostic colors
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = '#db4b4b', bg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = '#e0af68', bg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#0db9d7', bg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = '#10B981', bg = 'NONE' })

require('lsps.luals')
require('lsps.gopls')
require('lsps.python')
