return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "williamboman/mason.nvim",
    init = function()
      local mr = require("mason-registry")
      local ensure_installed = {
        "arduino-language-server",
        "css-lsp",
        "clangd",
        "clang-format",
        "debugpy",
        "docker-language-server",
        "eslint-lsp",
        "gopls",
        "html-lsp",
        "json-lsp",
        "lemminx",
        "lua-language-server",
        "prettier",
        "prettierd",
        "basedpyright",
        "rust-analyzer",
        "sqlls",
        "stylua",
        "tailwindcss-language-server",
        "taplo",
        "typescript-language-server",
      }

      mr.refresh(function()
        for _, tool in ipairs(ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
    opts = function()
      return require("configs.mason")
    end,
  },
  -- Disabled to improve handling of large files
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          -- Enable treesitter highlighting and disable regex syntax
          pcall(vim.treesitter.start)
          -- Enable folding
          -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- vim.wo.foldmethod = "expr"
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      local ensure_installed = {
        "lua",
        "luadoc",
        "printf",
        "vim",
        "vimdoc",
        "html",
        "css",
        "python",
        "go",
        "rust",
        "cpp",
        "json",
        "yaml",
        "typescript",
        "javascript",
        "tsx",
        "dockerfile",
        "xml",
      }
      local already_installed = require("nvim-treesitter.config").get_installed()

      local to_install = vim
        .iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(already_installed, parser)
        end)
        :totable()

      require("nvim-treesitter").install(to_install)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require("configs.nvimtree")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      winopts = { border = "shadow", preview = { border = "shadow" } },
      fzf_colors = { bg = { "bg", "NormalFloat" } },
      oldfiles = { include_current_session = true },
    },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Fzf search files" },
      { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Fzf search oldfiles" },
      { "<leader>fw", "<cmd>FzfLua live_grep<cr>", desc = "Fzf live grep" },
      { "<leader>fh", "<cmd>FzfLua highlights<cr>", desc = "Fzf search highlight groups" },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = function()
      return require("configs.toggleterm")
    end,
  },
}
