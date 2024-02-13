local M = {}

M.diffview = {
  n = {
    ["<leader>df"] = {
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd('DiffviewOpen')
        else
          vim.cmd('DiffviewClose')
        end
      end,
      "open diff"
    },
    ["<leader>hh"] = {
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd('DiffviewFileHistory %')
        else
          vim.cmd('DiffviewClose')
        end
      end,
      "open file history"
    }
  }
}

return M
