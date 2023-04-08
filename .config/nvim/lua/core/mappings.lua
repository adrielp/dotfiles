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
keymap("n", "<leader>n", ":Ex<cr>", opts)
-- keymap("n", "<C-d", "<C-d>zz", opts)
-- keymap("n", "<C-u", "<C-u>zz", opts)

-- spawns copilot from the given line
keymap("n", "<leader>cop", ":Copilot panel<cr>", opts)

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
