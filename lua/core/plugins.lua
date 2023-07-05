vim.keymap.set('n', '<leader>hrr', ':PackerSync<CR>')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Style
  use 'projekt0n/github-nvim-theme'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'startup-nvim/startup.nvim',
    requires = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'}
  }
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'

  -- Vim
  use 'terrortylor/nvim-comment'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'

  -- Rust
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use { 'simrat39/rust-tools.nvim', requires = 'neovim/nvim-lspconfig' }
  use {
      'rust-lang/rust.vim',
      ft = { "rust" },
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp' }
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'williamboman/mason.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'glepnir/lspsaga.nvim', requires = 'neovim/nvim-lspconfig' }

  -- Directory
  use 'nvim-tree/nvim-tree.lua'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  }
  use 'nvim-telescope/telescope-project.nvim'

  -- Git
  use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
