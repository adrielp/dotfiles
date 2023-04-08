-- Description: Fugitive plugin configuration
local auto_fugs = vim.api.nvim_create_augroup("auto_fugs", {})
local autocmd = vim.api.nvim_create_autocmd

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
-- vim.keymap.set("n", "<leader>gs", ":Git<CR>", {noremap = false})

autocmd("BufWinEnter", {
	group = auto_fugs,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = {buffer = bufnr, remap = false}

		-- NOTE: passing functions to keymap.set calling specific commands
		-- doesn't populate which-key help sections
		vim.keymap.set("n", "<leader>p", ":Git push", opts)
		vim.keymap.set("n", "<leader>P", ":Git pull --rebase", opts)
		vim.keymap.set("n", "<leader>gc", ":Git commit", opts)
		vim.keymap.set("n", "<leader>gca", ":G commit --amend", opts)
		vim.keymap.set("n", "<leader>gcan", ":G commit --amend --no-edit", opts)
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
	end,
})

-- misc fugitive settings
vim.g.fugitive_dynamic_colors = 1
