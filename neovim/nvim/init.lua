-- Set the Spacebar as our universal "Leader" key for custom shortcuts
vim.g.mapleader = " "

-- ==========================================
-- BASIC SETTINGS
-- ==========================================

-- Line numbers 
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation and Tabs 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Sync your system clipboard with Neovim
vim.opt.clipboard = "unnamedplus"

-- ==========================================
-- NEOVIDE SPECIFIC SETTINGS
-- ==========================================

if vim.g.neovide then
    -- Tell Neovide to use the Nerd Font.
    vim.o.guifont = "Mononoki Nerd Font:h12"
    
    -- Add a little bit of smooth animation to the cursor
    vim.g.neovide_cursor_animation_length = 0.13
end

-- ==========================================
-- PLUGIN MANAGER & THEME (lazy.nvim)
-- ==========================================

-- 1. Automatically downloads the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Loads the manager AND installs the TokyoNight theme
require("lazy").setup({
  -- 1. THEME 
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- 2. WHICH-KEY (Shows popup menus for your shortcuts)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },

  -- 3. NEO-TREE (The visual file explorer sidebar)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Adds the cool folder/file icons
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({})
      -- Press Ctrl+n to open or close the sidebar
      vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = "Toggle File Explorer" })
    end,
  },

  -- 4. TELESCOPE (The magical fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      -- Press Spacebar then 'f' then 'f' to search for files
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      -- Press Spacebar then 'f' then 'g' to search text inside files
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Search Text" })
    end,
  },

  -- 6. MASON & LSPCONFIG 
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- Start up the Mason app store
      require("mason").setup()
      
      -- Tell Mason to automatically install the Java engine (jdtls)
      require("mason-lspconfig").setup({
        ensure_installed = { "jdtls" }, 
      })

      -- Tell Neovim's translator how to talk to the Java engine
      local lspconfig = require("lspconfig")
      lspconfig.jdtls.setup({})
    end,
  },

  -- 7. AUTOPAIRS (Automatically closes (), {}, and "")
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- 8. COMMENT.NVIM (Easily comment out lines of code)
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- 9. NVIM-CMP (The auto-completion engine)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer", -- Suggests words used in your current file
      "hrsh7th/cmp-path",   -- Suggests folder paths
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Press Enter to accept a suggestion
        }),
        sources = cmp.config.sources({
          { name = 'buffer' },
          { name = 'path' }
        })
      })
    end,
  }
})