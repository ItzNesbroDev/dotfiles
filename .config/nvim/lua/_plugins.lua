local status, packer = pcall(require, 'packer')
if (not status) then return end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'lewis6991/impatient.nvim', config = function() require 'configs.impatient' end }
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- colorschemes
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' },
    -- config = function()
      -- require 'configs.colorscheme'
    -- end
  }
  use { "catppuccin/nvim", as = "catppuccin",
    config = function()
      require 'configs.colorscheme'
    end
  }

  -- lsp
  use { 'neovim/nvim-lspconfig', after = "nvim-cmp", config = function() require "configs.lsp" end }
  use { 'folke/lua-dev.nvim', module = "lua-dev" }
  use { 'glepnir/lspsaga.nvim', config = function() require "configs.lspsaga" end, after = "nvim-lspconfig" }
  use { 'jose-elias-alvarez/null-ls.nvim', config = function() require "configs.null-ls" end, after = "nvim-lspconfig" }
  use { 'williamboman/mason.nvim', config = function() require "configs.mason" end, after = "nvim-lspconfig" }
  use { 'williamboman/mason-lspconfig.nvim', after = "nvim-lspconfig" }
  use { 'b0o/SchemaStore.nvim', after = "nvim-lspconfig" }
  use { 'folke/lsp-colors.nvim', config = function() require "configs.lsp-colors" end, after = "nvim-lspconfig" }

  -- cmp
  use 'onsails/lspkind-nvim'
  use { 'L3MON4D3/LuaSnip', event = { "InsertEnter", "CmdlineEnter" } }
  use { 'hrsh7th/nvim-cmp', after = "LuaSnip", config = function() require 'configs.cmp' end }
  use { 'hrsh7th/cmp-buffer', after = { "nvim-cmp" } }
  use { 'hrsh7th/cmp-nvim-lsp', after = { "nvim-cmp" } }
  use { 'hrsh7th/cmp-path', after = { "nvim-cmp" } }
  use { 'hrsh7th/cmp-emoji', after = { "nvim-cmp" } }
  use { 'hrsh7th/cmp-nvim-lua', after = { "nvim-cmp" } }
  use { 'saadparwaiz1/cmp_luasnip', after = { "nvim-cmp" } }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help', after = { "nvim-cmp" } }
  use { 'hrsh7th/cmp-cmdline', event = "CmdlineEnter", after = { "nvim-cmp" } }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require "configs.treesitter" end,
    after = "lualine.nvim"
  }
  use { 'windwp/nvim-autopairs', after = "nvim-treesitter", config = function() require "configs.autopairs" end }
  use { 'windwp/nvim-ts-autotag', after = "nvim-treesitter", config = function() require "configs.ts-autotag" end }

  -- telescope
  use { 'nvim-telescope/telescope.nvim', after = "lualine.nvim", config = function() require "configs.telescope" end }
  use { 'nvim-telescope/telescope-file-browser.nvim' }

  -- editor
  use { 'nvim-lualine/lualine.nvim', config = function() require 'configs.lualine' end, after = 'neosolarized.nvim' }
  use { 'akinsho/nvim-bufferline.lua', config = function() require 'configs.bufferline' end, after = 'lualine.nvim' }
end)
