vim.keymap.set('n', '<leader>hrr', ':PackerSync<CR>')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  }
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'

  -- Vim
  use 'terrortylor/nvim-comment'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'gelguy/wilder.nvim'

  -- Dap
  use { 
    'jay-babu/mason-nvim-dap.nvim',
    requires = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    }
  }
  use 'mfussenegger/nvim-dap'
  use {
    'rcarriga/nvim-dap-ui',
    requires = { 
      'mfussenegger/nvim-dap', 
      'nvim-neotest/nvim-nio' 
    } ,
  }

  -- Xcode
  -- use {
  --   'xbase-lab/xbase',
  --   run = 'make install', -- or "make install && make free_space"
  --   requires = {
  --     "neovim/nvim-lspconfig",
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "nvim-lua/plenary.nvim", -- optional/requirement of telescope.nvim
  --   },
  -- }

  -- Rust
  use { 'simrat39/rust-tools.nvim', requires = 'neovim/nvim-lspconfig' }
  use {
    'rust-lang/rust.vim',
    ft = { "rust" },
  }

  -- Go
  use { 'leoluz/nvim-dap-go', requires = 'mfussenegger/nvim-dap' }

  -- Java
  use { 'mfussenegger/nvim-jdtls' }
 
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
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim"
    },
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  }
  use 'nvim-telescope/telescope-project.nvim'
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'notjedi/nvim-rooter.lua',
    config = function() require 'nvim-rooter'.setup() end
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" },
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-dap.nvim'
  -- use 'nvim-telescope/telescope-vimspector.nvim'

  -- Git
  use { 
    'NeogitOrg/neogit', 
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim'
    }
  }
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
