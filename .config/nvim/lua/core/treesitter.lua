-- nvim-treesitter main branch (0.12+) setup
-- Highlight, indent, etc. are now built into Neovim and enabled by default.
-- nvim-treesitter only manages parser installation and queries.

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to
  install_dir = vim.fn.stdpath('data') .. '/site',
}

-- Install parsers (no-op if already installed)
require('nvim-treesitter').install {
  'gitignore',
  'go',
  'gomod',
  'hcl',
  'hjson',
  'lua',
  'make',
  'markdown',
  'markdown_inline',
  'python',
  'regex',
  'rust',
}
