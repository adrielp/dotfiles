home = os.getenv("HOME")
undodirpath = home .. "/.config/nvim/undordir"

local options =  {
    shiftwidth = 4,
    errorbells = false,
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true ,
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
    background = "dark",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Globals
vim.opt.shortmess:append "c"
-- vim.g.NERDTreeShowLineNumbers = "1" -- show line numbers in nerd tree if using it

-- Themes
vim.cmd("colorscheme onedark")
vim.g.airline_theme = "onedark"
-- vim.g.gruvbox_contrast_dark = "hard"
-- vim.cmd("colorscheme gruvbox")

-- NetRW Settings
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
vim.g.netrw_preview = 1
vim.g.netrw_bufsettings = "noma nomod nu rnu nowrap ro nobl"
vim.g.fugitive_dynamic_colors = 1

-- Commands
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("autocmd Filetype nerdtree setlocal rnu nu")
