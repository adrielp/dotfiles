-- This file leverages an auto command group to automatically format 
-- Terraform and Terragrunt files ending in .hcl or .tf 
-- Requires that Terragrunt & Terraform are both installed locally
-- and requires the plenary.nvim lua package installed via packer

local Job = require('plenary.job')

local terra_fmt = vim.api.nvim_create_augroup("terra_fmt", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
    group = terra_fmt,
    pattern = "*.tf",
    callback = function()
        local fname = vim.api.nvim_buf_get_name(0)
        Job:new({
          command = 'terraform',
          args = {'fmt', fname},
        }):sync() -- or start()
        vim.api.nvim_cmd({cmd = "edit"}, {output = false})
    end,
})

autocmd("BufWritePost", {
    group = terra_fmt,
    pattern = "*.hcl",
    callback = function()
        local fname = vim.api.nvim_buf_get_name(0)
        Job:new({
          command = 'terragrunt',
          args = {'hclfmt', fname},
        }):sync() -- or start()
        vim.api.nvim_cmd({cmd = "edit"}, {output = false})
    end,
})
