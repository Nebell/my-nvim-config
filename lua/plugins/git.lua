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
}
