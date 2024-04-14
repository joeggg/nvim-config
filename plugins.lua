local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "python",
        "go",
        "rust",
        "cpp",
        "json",
        "yaml"
      }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true }
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "json-lsp",
        "pyright",
        "rust-analyzer",
        "gopls",
      }
    }
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    ft = { "python", "go", "json" },
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      return require 'custom.configs.none-ls'
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = 'neovim/nvim-lspconfig',
    opts = function()
      return require 'custom.configs.rust-tools'
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  }
}

return plugins
