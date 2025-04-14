-- DEBUGGING
local dap = require("dap")
local dapui = require("dapui")
local dappython = require("dap-python")
local map = vim.keymap.set

map("n", "<leader>b", function()
  dap.toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

map("n", "<leader>db", function()
  dap.continue()
end, { desc = "DAP continue" })

map("n", "<leader>du", function()
  dapui.toggle()
end, { desc = "Toggle DAP UI" })

map("n", "<leader>dp", function()
  dappython.test_method()
end, { desc = "DAP Python test method" })

map("n", "<leader>so", function()
  dap.step_over()
end, { desc = "DAP step over" })

map("n", "<leader>si", function()
  dap.step_into()
end, { desc = "DAP step into" })

map("n", "<leader>st", function()
  dap.step_out()
end, { desc = "DAP step out" })

map("n", "<leader>dq", function()
  dap.terminate()
end, { desc = "DAP terminate" })
