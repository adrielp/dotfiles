local options = {

  -- default options from NVChad
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "  ", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },

  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },

  window = {
    border = "none", -- none/single/double/shadow
  },

  layout = {
    spacing = 6, -- spacing between columns
  },

  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

-- custom registrations
local wk = require("which-key")

wk.register({
    n = {"<cmd>Oil<cr>", "  Open Oil"},
	f = {
		name = "  File",
		f = { "<cmd>Telescope find_files<cr>", "  Find File" },
		b = { "<cmd>Telescope oldfiles<cr>", "ﭯ  Recently Used Files" },
		g = { "<cmd>Telescope live_grep<cr>", "  Live Grep" },
		h = { "<cmd>Telescope help_tags<cr>", "  Help Tags" },
		s = { "<cmd>w<cr>", "  Save" },
		q = { "<cmd>q<cr>", "  Quit" },
		Q = { "<cmd>q!<cr>", "  Force Quit" },
        a = { "<cmd>qa<cr>", "   Quit All" },
	},
	g = {
		name = "۸ Git & </> LSP",
		b = { "<cmd>Telescope git_branches<cr>", " Git Branches" },
		c = { "<cmd>Telescope git_commits<cr>", "  Git Commits" },
		s = { "<cmd>Neogit<cr>", "  Git Status" },
	},
}, {prefix = "<leader>"})

return options
