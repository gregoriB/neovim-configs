require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "javascript", "python", "vim" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
