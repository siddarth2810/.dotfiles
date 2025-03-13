-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-tree/nvim-web-devicons'
}


  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use("folke/zen-mode.nvim")
  -- Add git-worktree.nvim here
  use 'rbmarliere/git-worktree.nvim'

  -- install without yarn or npm
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use({
      "scottmckendry/cyberdream.nvim" , as = "cyberdream",
      config = function()
          vim.cmd("colorscheme cyberdream")
      end
  })

    use {
    'dhananjaylatkar/cscope_maps.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("cscope_maps").setup({
        disable_maps = true,         -- disable default key mappings
        cscope = {
          picker = "telescope",      -- use Telescope as the picker
        },
      })
    end,
  }

  use ('nvim-treesitter/nvim-treesitter-context')
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use ('mfussenegger/nvim-dap')
  use ('mfussenegger/nvim-dap-ui')

  use({
      "VonHeikemen/lsp-zero.nvim",
      branch = "v3.x",
      requires = {
          --- Uncomment the two plugins below if you want to manage the language servers from neovim
          { "williamboman/mason.nvim" },
          { "williamboman/mason-lspconfig.nvim" },

          -- LSP Support
          { "neovim/nvim-lspconfig" },
          -- Autocompletion
          { "hrsh7th/nvim-cmp" },
          { "hrsh7th/cmp-nvim-lsp" },
          { "hrsh7th/cmp-buffer" },
          { "hrsh7th/cmp-path" },
          { "saadparwaiz1/cmp_luasnip" },
          { "hrsh7th/cmp-nvim-lua" },
          { "rafamadriz/friendly-snippets" },
          { "L3MON4D3/LuaSnip" },
      },
  })
end)
