local map = vim.keymap.set

-- Mappings for voyager with APT layout
-- Swap j and k
map({ "n", "v", "s", "o" }, "j", "k")
map({ "n", "v", "s", "o" }, "k", "j")

-- Swap n and l
map({ "n", "v", "s", "o" }, "n", "l")
map({ "n", "v", "s", "o" }, "l", "n")
map({ "n", "v", "s", "o" }, "N", "L")
map({ "n", "v", "s", "o" }, "L", "N")

-- move betweem windows
map({ "n", "v", "s", "o" }, "<C-h>", "<C-w>h")
map({ "n", "v", "s", "o" }, "<C-j>", "<C-w>k")
map({ "n", "v", "s", "o" }, "<C-k>", "<C-w>j")
map({ "n", "v", "s", "o" }, "<C-n>", "<C-w>l")

-- move up and down in plugins using terminal mode e.g. fzf-lua
map({ "t" }, "<C-j>", "<C-k>")
map({ "t" }, "<C-k>", "<C-j>")
