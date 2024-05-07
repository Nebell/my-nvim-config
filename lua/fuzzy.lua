-- fuzzy search
local mapping = {
    ["<C-j>"] = {
        require('telescope.actions').move_selection_next, type = "action",
        opts = { nowait = true, silent = true }
    },
    ["<C-k>"] = {
        require('telescope.actions').move_selection_previous, type = "action",
        opts = { nowait = true, silent = true }
    }
}

require('telescope').setup{
    defaults = {
        mappings = {
            i = mapping,
            n = mapping
        }
    },
    extensions = {
    },
}

local keyset = vim.keymap.set
local tel_builtin = require('telescope.builtin')
keyset({ "n", "v"}, "<Space>t", tel_builtin.builtin, {silent = true})
keyset({ "n", "v", "i" }, "<C-P>", tel_builtin.find_files, {silent = true})
keyset({ "n", "v", "i" }, "<C-F>", tel_builtin.current_buffer_fuzzy_find, {silent = true})

