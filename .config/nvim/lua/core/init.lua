-- Initializion of core configurations

-- load mappings first
require('core.mappings')

-- lazy load plugins
require('plugins')

-- load configs dependent on plugins
-- load terraform formatter which requires plugins to be installed (plenary.nvim)
require('core.terra_fmt')
require('core.fugitive')
require('core.settings')
require('core.lsp')
require('core.harpoon')
require('core.treesitter')
