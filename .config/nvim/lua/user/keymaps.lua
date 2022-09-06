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

-- Misc Remaps
keymap("i", "<C-c>", "<esc>", opts)
keymap("n", "<leader>u", ":UndotreeShow<cr>", opts)
keymap("n", "<leader>C", ":let @/ = ''<cr>", opts)
keymap("n", "<leader>so", ":so %<cr>", opts)
keymap("t", "<esc>", "<c-\\><C-n>", term_opts)
-- keymap("n", "<leader>n", ":Ex<cr>:set rnu<cr>", opts) -- Keymap for netrw if you want to use that instead of filetree

-- Navigation Remaps
keymap("n", "<leader>h", ":wincmd h<cr>", opts)
keymap("n", "<leader>j", ":wincmd j<cr>", opts)
keymap("n", "<leader>k", ":wincmd k<cr>", opts)
keymap("n", "<leader>l", ":wincmd l<cr>", opts)
keymap("n", "<leader>sp", ":set paste!<cr>", opts)

-- Telescope Remaps
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)

-- LSP Remaps
keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "K","<cmd>lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

keymap("n", "<leader>n", ":Ex<cr>:set rnu nu<cr>", opts)
