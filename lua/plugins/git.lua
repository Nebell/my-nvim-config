---------- git signs for buffer -------------
return {
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('utils').async_run(require('gitsigns').setup) end,
        event = "BufReadPost",
    },

    ---------- git diff -------------
    {
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        event = "BufReadPost"
    },

    ---------- git branchs ----------
    {
        "rbong/vim-flog",
        keys = {
            { "<Leader>gb", "<CMD>Flogsplit<CR>" },
        },
        config = function()
            vim.api.nvim_create_autocmd({ "FileType" }, {
                pattern = "floggraph",
                callback = function()
                    vim.api.nvim_buf_set_keymap(
                        0, "n", "q", "<CMD>close<CR>",
                        { noremap = true, silent = true }
                    )
                end
            })
        end,
        dependencies = "tpope/vim-fugitive",
    },
    {
        "tpope/vim-fugitive",
    }
}
