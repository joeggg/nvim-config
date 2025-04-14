local map = vim.keymap.set

-- Renamer function from NvChad
local renamer = function()
  local api = vim.api
  local var = vim.fn.expand("<cword>")
  local buf = api.nvim_create_buf(false, true)
  local opts = { height = 1, style = "minimal", border = "single", row = 1, col = 1 }

  opts.relative, opts.width = "cursor", #var + 15
  opts.title, opts.title_pos = { { " Renamer ", "@comment.danger" } }, "center"

  local win = api.nvim_open_win(buf, true, opts)
  vim.wo[win].winhl = "Normal:Normal,FloatBorder:Removed"
  api.nvim_set_current_win(win)

  api.nvim_buf_set_lines(buf, 0, -1, true, { " " .. var })

  vim.bo[buf].buftype = "prompt"
  vim.fn.prompt_setprompt(buf, "")
  vim.api.nvim_input("A")

  vim.keymap.set({ "i", "n" }, "<Esc>", "<cmd>q!<CR>", { buffer = buf })

  vim.fn.prompt_setcallback(buf, function(text)
    local newName = vim.trim(text)
    api.nvim_buf_delete(buf, { force = true })

    if #newName > 0 and newName ~= var then
      local params = vim.lsp.util.make_position_params()
      params.newName = newName
      vim.lsp.buf_request(0, "textDocument/rename", params)
    end
  end)
end

return {
  on_attach = function(_, bufnr)
    local function opts(desc)
      return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
    map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
    map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

    map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts("List workspace folders"))

    map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
    map("n", "<leader>ra", renamer, opts("NvRenamer"))

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
    map("n", "gr", vim.lsp.buf.references, opts("Show references"))
  end,
}
