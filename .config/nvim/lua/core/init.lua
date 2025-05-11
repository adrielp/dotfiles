-- Initializion of core configurations

-- lazy load plugins
require('plugins')

-- I originally had mappings loading first, for some reason. I think it was
-- important, but I can't remember why, and it doesn't appear to be an issue
-- now. If I run into issues then I'll move back.
require('core.mappings')

-- load configs dependent on plugins
-- load terraform formatter which requires plugins to be installed (plenary.nvim)
require('core.terra_fmt')
require('core.settings')
require('core.harpoon')
require('core.treesitter')
require('core.lualine')

-- No longer using fugitive, but I miss it.
--require('core.fugitive')
-- lazygit is currently empty of config
-- require('core.lazygit')
-- No longer using lsp-zero, but make take the keybinds later
-- require('core.lsp')
