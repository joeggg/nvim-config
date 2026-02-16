return {
  keymap = {
    preset = "enter",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },

  appearance = {
    nerd_font_variant = "normal",
  },

  completion = {
    menu = { border = "single" },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
      window = { border = "single" },
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },

  signature = { enabled = true, window = { border = "single" } },
}
