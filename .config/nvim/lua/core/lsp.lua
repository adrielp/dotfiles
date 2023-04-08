-- This file contains LSP (Language Server Protocol) configurations

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)
lsp.setup()

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

-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

-- custom registrations
local wk = require("which-key")
wk.register({
	g = {
		d = { vim.lsp.buf.definition, "Go to definition" },
	},
	K = { vim.lsp.buf.hover, "Buff Hover"},
	v = {
		w = {
			s = { vim.lsp.buf.workspace_symbol, "Workspace Symbol" },
		},
		d = { vim.diagnostic.open_float, "Diagnostic Open Float"},
		c = {
			a = { vim.lsp.buf.code_action, "Code Action" },
		},
		r = {
			r = { vim.lsp.buf.references, "LSP References" },
			n = { vim.lsp.buf.rename, "LSP Rename" },
		},
	},
	-- ["<C-h>"] = { vim.lsp.buf.signature_help, "Signature Help" },
}, { prefix = "<leader>" })
