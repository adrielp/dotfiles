local home = os.getenv("HOME")
local undodirpath = home .. "/.config/nvim/undodir"

local options =  {
    shiftwidth = 4,
    errorbells = false,
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,
    nu = true,
    rnu = true,
    wrap = false,
    ignorecase = true,
    swapfile = false,
    backup = false,
    undodir = undodirpath,
    undofile = true,
    startofline = false,
    confirm = true,
    guicursor = nil,
    colorcolumn = "80",
    termguicolors = true,
    syntax = "on",
    completeopt = "menuone,noinsert,noselect",
    -- enable if you want a dark background, leaving commented out uses transparent from line 49
    -- background = "dark",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Globals
vim.opt.shortmess:append "c"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50


-- NetRW Settings
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
vim.g.netrw_preview = 1
vim.g.netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
vim.g.fugitive_dynamic_colors = 1

-- Commands
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
