return {
  "nvim-tree/nvim-web-devicons",
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local theta = require("alpha.themes.theta")
      theta.file_icons.provider = "devicons"
      require("alpha").setup(theta.config)
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     blink_cmp = true,
  --     diffview = true,
  --     whichkey = true,
  --     color_overrides = {
  --       mocha = {
  --         base = "#22213d",
  --         mantle = "#342038",
  --         crust = "#2d245c",
  --       },
  --     },
  --   },
  -- },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",
      })
      require("onedark").load()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      return require("configs.lualine")
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "md" },
    opts = {},
  },
}
