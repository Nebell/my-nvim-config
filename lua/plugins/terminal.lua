---------- terminal -------------
return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        direction = "float",
    },
    keys = {
        { "<C-T>", "<CMD>ToggleTerm<CR>",            mode = { "i", "n", "v" }, { silent = true } },
        { "<C-T>", "<C-\\><C-n><CMD>ToggleTerm<CR>", mode = 't',               { silent = true } },
        { "<ESC>", "<C-\\><C-n>",                    mode = 't',               { silent = true } },
    }
}
