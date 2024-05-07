-- UTF-8
vim.g.encoding = "UTF-8"

-- line number
vim.o.relativenumber = true
vim.o.number = true

-- indent
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4

vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.bo.smartindent = true

-- search
vim.o.hlsearch = true
vim.o.autoread = true
vim.o.incsearch = true

-- cmd line
vim.o.cmdheight = 2

-- autoread
vim.o.autoread = true
vim.bo.autoread = true

-- auto completion
vim.o.wildmenu = true

-- keymap before loading vimspector
vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'

-- disable python provider for reducing startup time
vim.g.loaded_python3_provider = 0

-- plugins
utils = require('utils')
require('plugins').setup()
local keyset = vim.keymap.set

-- theme
require('theme')

-- Terminal
-- vim.g.terminal_key = "<S-T>"
vim.g.floaterm_height = 0.8
vim.g.floaterm_width = 0.8
keyset("i", "<C-T>", "<ESC>:FloatermToggle<CR>", {silent = true})
keyset("n", "<C-T>", ":FloatermToggle<CR>", {silent = true})
keyset("t", "<C-T>", "<C-\\><C-n>:FloatermToggle<CR>", {silent = true})

-- Custom
--- shift lines
keyset("i", "<A-DOWN>", "<ESC>ddpi")
keyset("i", "<A-UP>", "<ESC>ddkPi")
keyset("n", "<A-DOWN>", "ddp")
keyset("n", "<A-UP>", "ddkP")

keyset("n", "<C-K>", "15k")
keyset("n", "<C-J>", "15j")
--- indent
-- Ctrl-I will act as <Tab>: https://github.com/neovim/neovim/issues/5916
-- keyset("n", "<TAB>", ">>") 
keyset("n", "<S-TAB>", "<<")
keyset("v", "<TAB>", ">")
keyset("v", "<S-TAB>", "<")

-- nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

keyset({ "n", "i", "v" }, "<C-G>", "<CMD>NvimTreeToggle<CR>", {silent = true})
keyset({ "n", "i", "v" }, "<Leader>loc", "<CMD>NvimTreeFindFile<CR>", {silent = true})

-- buffer line
vim.opt.termguicolors = true

keyset({ "n", "v", "i" }, "<A-Left>", "<cmd>BufferLineCyclePrev<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<A-Right>", "<cmd>BufferLineCycleNext<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<C-H>", "<cmd>BufferLineCyclePrev<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<C-L>", "<cmd>BufferLineCycleNext<CR>", {silent = true})

-- symbols outline
keyset({ "n", "i", "v" }, "<C-S>", "<CMD>Lspsaga outline<CR>", {silent = true})

-- fuzzy
--- telescope
keyset({ "n", "v"}, "<Space>t", "<CMD>Telescope<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<C-P>", "<CMD>Telescope find_files<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<C-F>",  "<CMD>Telescope current_buffer_fuzzy_find<CR>", {silent = true})
