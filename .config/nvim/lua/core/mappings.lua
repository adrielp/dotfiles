-- options
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Awesome keymaps from theprimeagen
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Misc Remaps
keymap("i", "<C-c>", "<esc>", opts)
keymap("n", "<leader>u", ":UndotreeShow<cr>", opts)
keymap("n", "<leader>C", ":let @/ = ''<cr>", opts)
keymap("n", "<leader>so", ":so %<cr>", opts)
keymap("t", "<esc>", "<c-\\><C-n>", term_opts)
keymap("n", "<leader>n", ":Oil<cr>", opts)
-- keymap("n", "<leader>n", ":Ex<cr>", opts)
-- keymap("n", "<C-d", "<C-d>zz", opts)
-- keymap("n", "<C-u", "<C-u>zz", opts)

-- spawns copilot from the given line
-- keymap("n", "<leader>cop", ":Copilot panel<cr>", opts)

-- Navigation Remaps
keymap("n", "<leader>h", ":wincmd h<cr>", opts)
keymap("n", "<leader>j", ":wincmd j<cr>", opts)
keymap("n", "<leader>k", ":wincmd k<cr>", opts)
keymap("n", "<leader>l", ":wincmd l<cr>", opts)
keymap("n", "<leader>sp", ":set paste!<cr>", opts)

-- File Remaps
keymap("n", "<leader>fs", ":w<cr>", opts)
keymap("n", "<leader>fq", ":q<cr>", opts)
keymap("n", "<leader>fQ", ":q!<cr>", opts)
keymap("n", "<leader>qa", ":qa<cr>", opts)
keymap("n", "<leader>QA", ":qa!<cr>", opts)

-- Which Key Helpers
local wk = require("which-key")
wk.add({
    mode = { "n" },
    {"<leader>n", "<cmd>Oil<cr>", desc = "Open Oil"},
    {"<leader>f", group = file},
    {"<leader>ff", function() Snacks.picker.files() end,   desc = "Find File"},
    {"<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers"},
    {"<leader>fg", function() Snacks.picker.grep() end,    desc = "Live Grep"},
    {"<leader>fh", function() Snacks.picker.help() end,    desc = "Help Tags"},
    {"<leader>fs", "<cmd>w<cr>", desc = "Save"},
    {"<leader>fq", "<cmd>q<cr>", desc = "Quit"},
    {"<leader>fQ", "<cmd>q!<cr>", desc = "Force Quit"},
    {"<leader>qa", "<cmd>qa<cr>", desc = "Quit All"},
    {"<leader>QA", "<cmd>qa!<cr>", desc = "Force Quit All"},
    {"<leader>g", group = git},
    {"<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches"},
    {"<leader>gc", function() Snacks.picker.git_log() end,      desc = "Git Log"},
    {"<leader>gs", function() Snacks.lazygit.open() end, desc = "Git Status"},
    {"<leader>co", "<cmd>CodeCompanionChat<cr>", desc = "Code Companion Chat"},
    {"<leader>fmt", "<cmd>set formatprg=<cr>", desc = "Reset formatter"},
    {"<leader>jq", "<cmd>%!jq .<cr>", desc = "Pretty format with jq"},
    {"<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Open Claude Code"},
})

wk.add({
    mode = {"i"},
    {"jj", "<Esc>", desc = "Escape"}
})
