local keyset = vim.keymap.set

keyset({"n", "v"}, "<C-K>", "15k")
keyset({"n", "v"}, "<C-J>", "15j")
--- indent
-- Ctrl-I will act as <Tab>: https://github.com/neovim/neovim/issues/5916
-- keyset("n", "<TAB>", ">>")
keyset("n", "<S-TAB>", "<<")
keyset("v", "<TAB>", ">")
keyset("v", "<S-TAB>", "<")

