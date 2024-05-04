-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'folke/neodev.nvim' -- Configure lua-language-server for neovim config

  use 'sbdchd/neoformat' -- Formatter

  use 'nvim-tree/nvim-web-devicons' -- Icons

  use {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
          require('dashboard').setup {
              -- config
              theme = 'hyper',
              disable_move = true,
              config = {
                  header = require("lostfiddler.dashboard_header")
              }
          }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
  }

  use {
      'folke/which-key.nvim',
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require('which-key').setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  }

  use 'alvan/vim-closetag'
  use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
use 'Raimondi/delimitMate'

  -- color-schemes
  use 'ellisonleao/gruvbox.nvim'
  use 'catppuccin/nvim'
end)
