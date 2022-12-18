-- This file leverages an auto command group to automatically format 
-- Terraform and Terragrunt files ending in .hcl or .tf 
-- Requires that Terragrunt & Terraform are both installed locally.

local terra_fmt = vim.api.nvim_create_augroup("terra_fmt", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
    group = terra_fmt,
    pattern = "*.tf",
    callback = function()
        vim._system('terraform fmt')
        vim.api.nvim_cmd({cmd = "edit"}, {output = false})
    end,
})

autocmd("BufWritePost", {
    group = terra_fmt,
    pattern = "*.hcl",
    callback = function()
        vim._system('terragrunt hclfmt')
        vim.api.nvim_cmd({cmd = "edit"}, {output = false})
    end,
})
