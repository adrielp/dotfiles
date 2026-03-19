# Migrate Telescope → Snacks Picker

## Overview

Replace `nvim-telescope/telescope.nvim` with the built-in `snacks.nvim` picker for all fuzzy-finding
workflows. Snacks picker covers every Telescope builtin currently in use, runs faster out of the box,
and is already a dependency — so this reduces the plugin count with no functional regression.

## Current State Analysis

### Plugins
- `nvim-telescope/telescope.nvim` declared in `lua/plugins/init.lua:101-104` with `plenary.nvim` dep
- `folke/snacks.nvim` already installed, but `picker` module not explicitly enabled in main opts
- `plenary.nvim` must be retained — used by `harpoon` (dep) and `core/terra_fmt.lua` directly

### Keymaps (all in `lua/core/mappings.lua`)
Duplicate registration pattern: raw `keymap()` call + matching `wk.add()` entry for each bind.

| Keymap | Current (Telescope) | Snacks equivalent |
|---|---|---|
| `<leader>ff` | `telescope.builtin.find_files()` | `Snacks.picker.files()` |
| `<leader>fg` | `telescope.builtin.live_grep()` | `Snacks.picker.grep()` |
| `<leader>fb` | `telescope.builtin.buffers()` | `Snacks.picker.buffers()` |
| `<leader>fh` | `telescope.builtin.help_tags()` | `Snacks.picker.help()` |
| `<leader>gb` | `telescope.builtin.git_branches()` | `Snacks.picker.git_branches()` |
| `<leader>gc` | `telescope.builtin.git_commits()` | `Snacks.picker.git_log()` |

### Snacks opts gap
`lua/plugins/init.lua:49-62` — `picker` is not listed under snacks opts. It is only implicitly
configured via the opencode dependency merge. This means the dashboard may not consistently use
the snacks picker, and there is no canonical place for picker configuration.

## Desired End State

- `telescope.nvim` removed from `plugins/init.lua`
- `plenary.nvim` retained as a standalone dependency (for harpoon + terra_fmt)
- `picker = { enabled = true }` added to the main snacks opts block
- All 6 telescope keymaps in `mappings.lua` replaced with `Snacks.picker.*` calls
- All 6 matching which-key entries updated to reference snacks (no `<cmd>Telescope …` strings)
- `nvim-web-devicons` retained (used by lualine and oil, not only telescope)
- No broken references to `telescope` anywhere in the config

## What We're NOT Doing

- Not removing `plenary.nvim` — still required by harpoon and terra_fmt
- Not removing `nvim-web-devicons` — still required by lualine and oil
- Not configuring advanced snacks picker options (layouts, custom sources, etc.) — defaults are fine
- Not migrating harpoon's UI to snacks picker
- Not touching the opencode snacks picker integration already in place

---

## Phase 1: Enable Snacks Picker in Main Opts

**File**: `lua/plugins/init.lua`

Add `picker = { enabled = true }` to the snacks opts block alongside the existing modules.
Also add `input = { enabled = true }` while here — it's already used by opencode but not
declared in the main opts, which is inconsistent.

**Change** (`plugins/init.lua:49-62`):
```lua
-- Before
opts = {
    dashboard = { enabled = true },
    statuscolumn = { enabled = true },
    zen = { enabled = true },
    terminal = { enabled = true },
    lazygit = { enabled = true },
},

-- After
opts = {
    dashboard = { enabled = true },
    statuscolumn = { enabled = true },
    zen = { enabled = true },
    terminal = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    input = { enabled = true },
},
```

### Success Criteria:
- [x] `:lua Snacks.picker.files()` opens the snacks picker without error
- [x] `:checkhealth snacks` reports picker as enabled

---

## Phase 2: Remove Telescope Plugin, Retain Plenary

**File**: `lua/plugins/init.lua`

Remove the `telescope.nvim` plugin entry. Convert its `plenary.nvim` dependency into a
standalone top-level entry so harpoon and terra_fmt continue to work.

**Change** (`plugins/init.lua:100-105`):
```lua
-- Remove entirely:
{
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim'
    }
},

-- Add as standalone (near harpoon, which already declares it as dep):
-- plenary is kept implicitly via harpoon's dep declaration — no explicit entry needed
-- (lazy.nvim deduplicates dependencies; harpoon's dep keeps it installed)
```

> Note: No explicit standalone plenary entry is needed. Lazy.nvim resolves `plenary.nvim` from
> harpoon's `dependencies` declaration (`plugins/init.lua:95`) and keeps it installed. The
> `terra_fmt.lua` `require('plenary.job')` will continue to work.

### Success Criteria:
- [x] `telescope.nvim` no longer appears in `:Lazy` plugin list after `:Lazy clean`
- [x] `plenary.nvim` still appears in `:Lazy` (retained via harpoon dep)
- [x] `:lua require('plenary.job')` does not error

---

## Phase 3: Replace Telescope Keymaps in mappings.lua

**File**: `lua/core/mappings.lua`

Two changes per bind: remove the raw `keymap()` call, update the `wk.add()` entry.

**Remove the "Telescope Remaps" block** (`mappings.lua:45-51`):
```lua
-- Remove entirely:
-- Telescope Remaps
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
```

**Update the wk.add() block** — replace the 6 Telescope-referencing entries:
```lua
-- Before (mappings.lua:66-68, 76-77):
{"<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find File"},
{"<leader>fb", "<cmd>Telescope oldfiles<cr>",    desc = "Recently Used Files"},
{"<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live Grep"},
{"<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help Tags"},
{"<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches"},
{"<leader>gc", "<cmd>Telescope git_commits<cr>",  desc = "Git Commits"},

-- After:
{"<leader>ff", function() Snacks.picker.files() end,        desc = "Find File"},
{"<leader>fb", function() Snacks.picker.buffers() end,      desc = "Buffers"},
{"<leader>fg", function() Snacks.picker.grep() end,         desc = "Live Grep"},
{"<leader>fh", function() Snacks.picker.help() end,         desc = "Help Tags"},
{"<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches"},
{"<leader>gc", function() Snacks.picker.git_log() end,      desc = "Git Log"},
```

> Note: `<leader>fb` previously mapped to `oldfiles` in which-key but `buffers()` in the raw
> keymap — these were inconsistent. Unifying to `Snacks.picker.buffers()` (open buffers) is
> the more useful default. `Snacks.picker.recent()` is available if recent files is preferred.

### Success Criteria:
- [x] `<leader>ff` opens snacks file picker
- [x] `<leader>fg` opens snacks grep picker
- [x] `<leader>fb` opens snacks buffers picker
- [x] `<leader>fh` opens snacks help picker
- [x] `<leader>gb` opens snacks git branches picker
- [x] `<leader>gc` opens snacks git log picker
- [x] `:grep` for `telescope` in `lua/` returns zero live references

---

## Testing Strategy

All verification is manual (no automated test harness in this config).

### After Phase 1:
1. Open nvim, run `:lua Snacks.picker.files()` — picker should open
2. Run `:checkhealth snacks`

### After Phase 2:
1. Run `:Lazy` — telescope.nvim should be absent
2. Run `:Lazy clean` to remove downloaded files
3. Open a `.tf` file and save — terraform fmt should still trigger (plenary.job)

### After Phase 3:
1. Test each of the 6 keymaps manually
2. Open which-key (`<leader>?` or just `<leader>`) — no Telescope labels should appear
3. Restart nvim cleanly — no startup errors

### Regression check:
- Harpoon still works (`<leader>a`, `<C-e>`)
- Lazygit still works (`<leader>gs`)
- Oil still works (`<leader>n`)
- Lualine renders without icon errors

## References

- Snacks picker docs: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
- Current plugins: `lua/plugins/init.lua`
- Current keymaps: `lua/core/mappings.lua`
