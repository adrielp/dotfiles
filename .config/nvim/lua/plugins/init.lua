-- lazy plugin configuration

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugs = {
    -- Essential Plugins
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        init = function()
            require('nvim-autopairs').setup{}
        end
    },
    -- May revisit and try jiaoshijie/undotree instead, but mbbill/undotree
    -- seems more maintained currently, even though it's vimscript
    'mbbill/undotree',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }

    },
    -- TODO: Replace with local LLM or something better than CoPilot.
    'github/copilot.vim',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {'nvim-treesitter/playground'},
    'theprimeagen/harpoon',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    -- Theme
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'cyberdream'
        end
    },
    -- TODO: Re-evaluate config
    -- Development of this plugin stopped, now it's all NVIM native
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'}

            -- Optionals
            -- {'hrsh7th/cmp-buffer'},
            -- {'hrsh7th/cmp-path'},
            -- {'saadparwaiz1/cmp_luasnip'},
            -- {'hrsh7th/cmp-nvim-lua'},
            -- {'rafamadriz/friendly-snippets'},
        }
    },
    -- Only load whichkey after all the gui
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    -- TODO: Re-evaluate config
    -- Might want to just re-implement myself, or add autocommands
    {
        "darrikonn/vim-gofmt",
    },
    -- TODO: It's just an autocmd, re-implement myself to reduce plugin count
    {
        "arnamak/stay-centered.nvim",
        init = function()
            require('stay-centered').setup{}
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim", -- git diff integration
            "nvim-telescope/telescope.nvim"
        },
        config = true
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require ('Comment').setup()
        end,
    },
    {
        'stevearc/oil.nvim',
        -- opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        init = function()
            require('oil').setup{}
        end
    },
    -- TODO: Re-evaluate config eventually
    {
        'David-Kunz/gen.nvim',
            opts = {
            model = "llama3", -- The default model to use.
            host = "localhost", -- The host running the Ollama service.
            port = "11434", -- The port on which the Ollama service is listening.
            quit_map = "q", -- set keymap for close the response window
            retry_map = "<c-r>", -- set keymap to re-send the current prompt
            init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
            -- Function to initialize Ollama
            command = function(options)
                local body = {model = options.model, stream = true}
                return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
            show_prompt = false, -- Shows the prompt submitted to Ollama.
            show_model = false, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = false, -- Never closes the window automatically.
            debug = false -- Prints errors and the command which is run.
        }
    },
    -- TODO: Re-evaluate config - not sure I'm ready to use it yet
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- dim = { enabled = true },
            dashboard = { enabled = true },
            indent = { enabled = true },
            statuscolumn = { enabled = true },
            zen = { enabled = true },
            -- words = { enabled = true },
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        'mfussenegger/nvim-dap'
    }
}

-- can add opts to .setup(plugs) 
require("lazy").setup(plugs)

