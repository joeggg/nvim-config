return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      { "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
    },
    version = "*", -- doing this instead of 'false' as recommended due to breaking changes often getting installed
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    keys = { "<leader>aa", "<leader>an", "<leader>az" },
    opts = {
      provider = "copilot-cli",
      acp_providers = {
        ["copilot-cli"] = {
          command = "copilot",
          args = { "--acp" },
          env = {
            DBUS_SESSION_BUS_ADDRESS = os.getenv("DBUS_SESSION_BUS_ADDRESS"),
          },
        },
        ["kiro-cli"] = {
          command = "kiro-cli",
          args = { "acp" },
        },
      },
    },
  },
}
