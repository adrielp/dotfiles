-- lazy plugin configuration
--

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
    -- =========================================================================
    -- Essential Plugins
    -- =========================================================================
    {
        -- Docs: https://github.com/neovim/nvim-lspconfig
        -- Data only plugin
        'neovim/nvim-lspconfig',
    },
    {
        -- Docs: https://github.com/echasnovski/mini.nvim
        'echasnovski/mini.nvim', version = '*',
        init = function()
            -- Docs: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-icons.md
            require('mini.icons').setup()
            -- Docs: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-snippets.md
            require('mini.snippets').setup()
            -- Docs: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
            require('mini.pairs').setup()
            -- Docs: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-comment.md
            require('mini.comment').setup()
            -- Docs: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-completion.md
            require('mini.completion').setup()
        end,
    },
    {
        -- Docs: https://github.com/folke/snacks.nvim
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- dim = { enabled = true },
            dashboard = { enabled = true },
            -- indent = { enabled = true }, -- As of 5/23/25 throws errors
            statuscolumn = { enabled = true },
            zen = { enabled = true },
            terminal = { enabled = true },
            lazygit = { enabled = true },
            -- git = { enabled = true },
            -- gitbrowse = { enabled = true },
            -- explorer = { enabled = true }, -- TODO: Replace oil w/ this
            -- later.
            -- words = { enabled = true },
        },
    },
    {
        -- Docs: https://github.com/mbbill/undotree
        -- Note: mbbill is vimscript, but actively maintained
        'mbbill/undotree',
    },
    {
        -- Docs: https://github.com/nvim-lualine/lualine.nvim
        -- TODO: Adjust default config to be more practical for my use cases
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        -- Docs: https://github.com/nvim-treesitter/nvim-treesitter
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/playground'
        }
    },
    {
        -- Docs: https://github.com/darrikonn/vim-gofmt
        -- Minimal version of vim-go
        -- TODO: Replace with native autocommands
        "darrikonn/vim-gofmt",
    },
    {
        -- Docs: https://github.com/ThePrimeagen/harpoon/tree/harpoon2
        'theprimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            require('harpoon').setup()
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    -- =========================================================================
    -- Theme/Styling Related Plugins
    -- =========================================================================
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'cyberdream'
        end
    },
    {
        -- Docs: https://github.com/folke/which-key.nvim
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
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
    {
        -- Docs: https://github.com/arnamak/stay-centered.nvim
        -- TODO: Replace with native autocommands
        "arnamak/stay-centered.nvim",
        init = function()
            require('stay-centered').setup{}
        end
    },
    -- {
    --     -- Docs: https://github.com/NeogitOrg/neogit
    --     "NeogitOrg/neogit",
    --     init = function()
    --         require('neogit').setup()
    --     end,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "sindrets/diffview.nvim", -- git diff integration
    --         "nvim-telescope/telescope.nvim"
    --     },
    --     config = true
    -- },
    {
        'stevearc/oil.nvim',
        -- opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        init = function()
            require('oil').setup{}
        end
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
    -- =========================================================================
    -- LSP Related Plugins
    -- =========================================================================
    {
        -- Docs: https://github.com/mason-org/mason.nvim
        'williamboman/mason.nvim',
        init = function()
            require("mason").setup()
        end,
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
        dependencies = {
            {'williamboman/mason-lspconfig.nvim'},
        },
    },
    {
        -- Docs: https://github.com/mfussenegger/nvim-dap
        'mfussenegger/nvim-dap',
        dependencies = {
            {
                -- Docs: https://github.com/leoluz/nvim-dap-go
                'leoluz/nvim-dap-go',
                init = function()
                    require("dap-go").setup()
                end,
            },
        }

    },
    -- Things seem to be properly working now.
    -- In the future, I may want to revisit the following plugins
    -- hrsh7th/cmp-nvim-lsp
    -- hrsh7th/cmp-buffer
    -- hrsh7th/cmp-path
    -- hrsh7th/cmp-cmdline
    -- hrsh7th/nvim-cmp
    -- L3MON4D3/LuaSnip
    -- rafamadriz/friendly-snippets
    -- VonHeikemen/lsp-zero.nvim (which is no longer supported in nvim 0.11.0+)
    -- =========================================================================
    -- AI Related Plugins
    -- =========================================================================
    -- Enable if using copilot w/ codecompanion
    -- {'github/copilot.vim'},
    {
        -- Docs: https://github.com/greggh/claude-code.nvim
        'greggh/claude-code.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('claude-code').setup()
        end,
    },
    {
        -- Docs: https://github.com/olimorris/codecompanion.nvim
        -- TODO: Install and setup 
        -- https://github.com/Davidyz/VectorCode/blob/main/docs/cli.md
        'olimorris/codecompanion.nvim',
        dependencies = {
            'j-hui/fidget.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-telescope/telescope.nvim',
            {
                'hrsh7th/nvim-cmp'
            },
            -- {
            --     'saghen/blink.cmp',
            --     lazy = false,
            --     version = "*",
            --     opts = {
            --         cmdline = { sources = {'cmdline' } },
            --         sources = {
            --             default = { 'lsp', 'path', 'buffer', 'codecompanion' },
            --         },
            --     },
            -- },
        },
        opts = {
            -- system_prompt = function(opts)
            --     return ""
            -- end,
            strategies = {
                chat = {
                    adapter = "anthropic",
                },
                inline = {
                    adapter = "anthropic",
                },
                cmd = {
                    adapter = "anthropic",
                }
            },
            adapters = {
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        env = {
                            api_key = "cmd:op read op://Private/AnthropicAPI/credential --no-newline"
                        },
                        schema = {
                            model = {
                                default = "claude-opus-4-20250514",
                            },
                        },
                    })
                    end
                    -- return require("codecompanion.adapters").extend("openai_compatible", {
                    -- env = {
                    --   url = "http://192.168.1.164:1234", -- optional: default value is ollama url http://127.0.0.1:11434
                    --   -- api_key = "OpenAI_API_KEY", -- optional: if your endpoint is authenticated
                    --   chat_url = "/v1/chat/completions", -- optional: default value, override if different
                    --   models_endpoint = "/v1/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
                    -- },
                    -- schema = {
                    --   model = {
                    --     default = "zeta",  -- define llm model to be used
                    --   },
                      -- temperature = {
                      --   order = 2,
                      --   mapping = "parameters",
                      --   type = "number",
                      --   optional = true,
                      --   default = 0.4,
                      --   desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
                      --   validate = function(n)
                      --     return n >= 0 and n <= 2, "Must be between 0 and 2"
                      --   end,
                      -- },
                      -- max_completion_tokens = {
                      --   order = 3,
                      --   mapping = "parameters",
                      --   type = "integer",
                      --   optional = true,
                      --   default = nil,
                      --   desc = "An upper bound for the number of tokens that can be generated for a completion.",
                      --   validate = function(n)
                      --     return n > 0, "Must be greater than 0"
                      --   end,
                      -- },
                      -- stop = {
                      --   order = 4,
                      --   mapping = "parameters",
                      --   type = "string",
                      --   optional = true,
                      --   default = nil,
                      --   desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
                      --   validate = function(s)
                      --     return s:len() > 0, "Cannot be an empty string"
                      --   end,
                      -- },
                      -- logit_bias = {
                      --   order = 5,
                      --   mapping = "parameters",
                      --   type = "map",
                      --   optional = true,
                      --   default = nil,
                      --   desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
                      --   subtype_key = {
                      --     type = "integer",
                      --   },
                      --   subtype = {
                      --     type = "integer",
                      --     validate = function(n)
                      --       return n >= -100 and n <= 100, "Must be between -100 and 100"
                      --     end,
                      --   },
                      -- },
                  --   },
                  -- })
                -- end,
                -- return require("codecompanion.adapters").extend("gemini", {
                --     env = {
                --         api_key = "cmd:op read op://Private/GeminiAPIKey/credential --no-newline"
                --     },
                -- })
		        -- end
                --     return require("codecompanion.adapters").extend("copilot", {
                --         schema = {
                --             model = {
                --                 default = "claude-3.7-sonnet",
                --             },
                --         },
                --     })
                -- end
            },
        },
    }
}

-- can add opts to .setup(plugs) 
require("lazy").setup(plugs)

