require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "c", "lua", "rust", "javascript", "python", "vim", "html" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  disable = { "html" }
}

-- Run :TSUpdate when treesitter is messing up!!!
