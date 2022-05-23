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
vim.g.gruvbox_contrast_dark = "hard"
vim.g.NERDTreeShowLineNumbers = "1"

-- Commands
vim.cmd("colorscheme gruvbox")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("autocmd Filetype nerdtree setlocal rnu nu")
