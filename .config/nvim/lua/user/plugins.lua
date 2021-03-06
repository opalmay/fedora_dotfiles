-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("lewis6991/impatient.nvim")
  use("wbthomason/packer.nvim") -- Have packer manage itself
  --use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  --
  use("shaunsingh/nord.nvim")
  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("tamago324/nlsp-settings.nvim")

  use("nvim-telescope/telescope.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- use("p00f/nvim-ts-rainbow")

  use({
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({ easing_function = "cubic" })
    end,
  })

  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("lewis6991/gitsigns.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use("moll/vim-bbye")
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  -- use({
  -- 	"chentau/live.nvim",
  -- 	config = function()
  -- 		require("live").setup()
  -- 	end,
  -- })
  -- use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
  -- use("tversteeg/registers.nvim")
  use("junegunn/vim-peekaboo")
  use({
    "ur4ltz/surround.nvim", -- sa/s in visual
    config = function()
      require("surround").setup({ mappings_style = "sandwich", space_on_closing_char = "false" })
    end,
  })
  -- For surround repeat
  use("tpope/vim-repeat")
  --   {
  --   nestable = {
  --     b = { "(", ")" },
  --     s = { "[", "]" },
  --     B = { "{", "}" },
  --     a = { "<", ">" }
  --     },
  --   linear = {
  --     q = { "'", "'" },
  --     t = { "`", "`" },
  --     d = { '"', '"' }
  --   },
  -- }
  -- use("spinks/vim-leader-guide")
  -- Put this at the end after all plugins
  use({
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({})
    end,
  })
  use("lukas-reineke/indent-blankline.nvim")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({
    "goolord/alpha-nvim",
  })
  -- use("feline-nvim/feline.nvim")
  -- use {
  --   "PHSix/faster.nvim",
  --   event = {"VimEnter *"},
  --   config = function()
  --     vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap=false, silent=true})
  --     vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap=false, silent=true})
  --     -- or
  --     -- vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_gj)', {noremap=false, silent=true})
  --     -- vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_gk)', {noremap=false, silent=true})
  --     -- if you need map in visual mode
  --     -- vim.api.nvim_set_keymap('v', 'j', '<Plug>(faster_vmove_j)', {noremap=false, silent=true})
  --     -- vim.api.nvim_set_keymap('v', 'k', '<Plug>(faster_vmove_k)', {noremap=false, silent=true})
  --   end
  -- }
  -- use({
  --   "akinsho/toggleterm.nvim",
  --   tag = "v1.*",
  --   config = function()
  --     require("toggleterm").setup()
  --   end,
  -- })
  -- use({
  --   "folke/trouble.nvim",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup({
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     })
  --   end,
  -- })
  -- use({
  --   "phaazon/hop.nvim",
  --   -- branch = "v1", -- optional but strongly recommended
  --   config = function()
  --     -- you can configure Hop the way you like here; see :h hop-config
  --     require("hop").setup()
  --   end,
  -- })
  -- use("unblevable/quick-scope")
  use("RRethy/vim-illuminate")
  -- use("mg979/vim-visual-multi")
  -- vim.g.Illuminate_ftHighlightGroups = {
  --     vim:blacklist = ['vimString']
  --     }
  vim.g.qs_delay = 1
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
