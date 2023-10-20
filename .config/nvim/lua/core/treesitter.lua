require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
      "dockerfile",
      "gitignore",
      "go",
      "gomod",
      "hcl",
      "hjson",
      "make",
      "regex",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,

    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
