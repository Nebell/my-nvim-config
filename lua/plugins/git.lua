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
        config = require('autocmd.closewin').quit_flog_win,
        dependencies = "tpope/vim-fugitive",
    },
    {
        "tpope/vim-fugitive",
    }
}
