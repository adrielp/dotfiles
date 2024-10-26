local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

local wk = require("which-key")

wk.add({
    mode = { "n" },
    {"<leader>a", mark.add_file, desc = "Add file to harpoon"},
    {"<C-e>", ui.toggle_quick_menu, desc = "Toggle Harpoon"},
    {"<C-h>", function() ui.nav_file(1) end, desc = "Navigate to Harpoon file 1"},
    {"<C-t>", function() ui.nav_file(2) end, desc = "Navigate to Harpoon file 2"},
    {"<C-n>", function() ui.nav_file(3) end, desc = "Navigate to Harpoon file 3"},
    {"<C-s>", function() ui.nav_file(4) end, desc = "Navigate to Harpoon file 4"},
})
