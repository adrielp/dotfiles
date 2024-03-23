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

-- Plugins I use
local plugs = {
	-- Essential Plugins
	--'tpope/vim-fugitive',
	{
	  'windwp/nvim-autopairs',
	  init = function()
		  require('nvim-autopairs').setup{}
	  end
	},
	'mbbill/undotree',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }

    },
	-- 'vim-airline/vim-airline',
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
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true
		},
		init = function()
			vim.cmd.colorscheme 'catppuccin-mocha'
		end
	},
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
					-- vim.cmd 'MasonUpdate'
					-- vim.cmd, 'MasonUpdate'
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
	  opts = function()
	    return require ('plugins.config.whichkey')
	  end,
	  config = function(_, opts)
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	    require("which-key").setup(opts)
	  end,
	},
    {
      "darrikonn/vim-gofmt",
    },
    {
      "arnamak/stay-centered.nvim",
       init = function()
         require('stay-centered').setup{}
       end
    },
    -- See the docs for more information
    -- https://github.com/huynle/ogpt.nvim
    {
      "huynle/ogpt.nvim",
        event = "VeryLazy",
        opts = {
          default_provider = "ollama",
          providers = {
            ollama = {
              api_host = os.getenv("OLLAMA_API_HOST") or "http://localhost:11434",
              api_key = os.getenv("OLLAMA_API_KEY") or "",
            }
          }
        },
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
    },
    -- NeoGit, a replacement for Vim Fugitive
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim", -- git diff integration
            "nvim-telescope/telescope.nvim"
        },
        config = true
    }

	-- Other Optionals
	-- 'vim-airline/vim-airline-themes',
	-- 'mfussenegger/nvim-dap'
	-- {
	-- 'darrikonn/vim-gofmt'
	-- run = ':GoUpdateBinaries'
	-- }
	-- {
	-- 'rose-pine/neovim',
	-- name = 'rose-pine',
	-- init = function()
	-- vim.cmd.colorscheme('rose-pine')
	-- end
	-- }

}

-- can add opts to .setup(plugs) 
require("lazy").setup(plugs)

