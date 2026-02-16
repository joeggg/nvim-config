return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = function()
      return require("configs.conform")
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    opts = function()
      return require("configs.blink")
    end,
    opts_extend = { "sources.default" },
  },
  {
    "mfussenegger/nvim-lint",
    init = function()
      require("configs.lint")
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    version = "^6",
    opts = function()
      return require("configs.rustacean")
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
}
