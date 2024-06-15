local plugins = {
  -- Inline git blame
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true }
  },
  -- Show git status on file tree icons
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true, ignore = false, },
      renderer = { icons = { show = { git = true } } }
    }
  },
  -- Syntax highlighting, add to this list for more languages
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
        "yaml",
        "typescript"
      }
    }
  },
  -- Required to set up LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  -- Add LSP servers to install to be handled by nvim-lspconfig
  -- Run :MasonInstallAll to update them (required for first time use)
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
        "typescript-language-server",
        "tailwindcss-language-server",
        "prettier",
        "eslint-lsp",
        "taplo",
        "sqlls"
      }
    }
  },
  -- For running certain extra tools like an LSP, such as ruff
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
  -- Format on save for rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- Rust LSP server, also provides inlay hints
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    ft = { "rust" },
    dependencies = {
      'neovim/nvim-lspconfig',
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = function()
      return require 'custom.configs.rustacean'
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
  -- For viewing git diffs, merge conflicts and file history
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
}

return plugins
