vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- TODO: Come back to this later and figure out what these functions do and how
-- to write my own. Would definitely like to leverage this time of function
-- particularly when doing commits, pushing, interactive rebasing, and ammending
-- without editing

local auto_fugs = vim.api.nvim_create_augroup("auto_fugs", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
    group = auto_fugs,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull --rebase'})
        end, opts)

        vim.keymap.set("n", "<leader>gc", function()
            vim.cmd.Git({'commit'})
        end, opts)

        vim.keymap.set("n", "<leader>gca", ":G commit --amend --no-edit", opts)
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)

    end,
})
