return {
    {
        'echasnovski/mini.cursorword',
        version = '*',
        event = "BufReadPost",
        config = function()
            require('mini.cursorword').setup({
                delay = 500,  -- 2s
            })
        end,
    },
}
