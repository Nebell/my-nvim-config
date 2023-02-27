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

-- plugins
require('plugins')
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

-- Coc
require('coc')

-- Custom
--- shift lines
keyset("i", "<A-DOWN>", "<ESC>ddpi")
keyset("i", "<A-UP>", "<ESC>ddkPi")
keyset("n", "<A-DOWN>", "ddp")
keyset("n", "<A-UP>", "ddkP")

keyset("n", "<C-UP>", "15k")
keyset("n", "<C-DOWN>", "15j")
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
local bufclose = function(bufnum) require('bufdelete').bufdelete(bufnum, true) end
require("bufferline").setup{
    options = {
        diagnostics = {"coc" , "nvim_lsp"},
        offsets = {{
            filetype = "NvimTree",
            text = function() return vim.fn.getcwd() end,
            highlight = "Directory",
            text_align = "left"
        }},
        close_command = bufclose, 
        right_mouse_command = bufclose, 
        left_mouse_command = "buffer %d",   
        middle_mouse_command = bufclose,
        always_show_bufferline = true, 
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        indicator = {
            style = "none"
        }
    }
}
keyset({ "n", "v", "i" }, "<A-Left>", "<cmd>BufferLineCyclePrev<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<A-Right>", "<cmd>BufferLineCycleNext<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<C-H>", "<cmd>BufferLineCyclePrev<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<C-L>", "<cmd>BufferLineCycleNext<CR>", {silent = true})

-- fuzzy search
require('fuzzy')

-- motion
-- require('leap')
keyset({"n"}, "f", "<Plug>(leap-forward-to)")
keyset({"n"}, "F", "<Plug>(leap-backward-to)")

-- symbols outline
vim.g.vista_default_executive = 'coc'
keyset({ "n", "i", "v" }, "<C-S>", "<CMD>Vista!!<CR>", {silent = true})
