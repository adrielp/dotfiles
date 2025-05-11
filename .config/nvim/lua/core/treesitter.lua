require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
      "gitignore",
      "go",
      "gomod",
      "hcl",
      "hjson",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "rust"
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
