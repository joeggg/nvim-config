return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    version = false,
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
