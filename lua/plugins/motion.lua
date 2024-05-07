return {
    ---------- motion -------------
    {
        'ggandor/leap.nvim',
        event = "BufReadPost",
        keys = {
            { "z", "<Plug>(leap-forward-to)" },
            { "Z", "<Plug>(leap-backward-to)" },
        },
        config = function() require('leap') end
    },


    ---------- block move -------------
    {
        'booperlv/nvim-gomove',
        event = 'BufReadPost',
        config = function()
            require("gomove").setup {
                -- whether or not to map default key bindings, (true/false)
                map_defaults = true,
                -- whether or not to reindent lines moved vertically (true/false)
                reindent = true,
                -- whether or not to undojoin same direction moves (true/false)
                undojoin = true,
                -- whether to not to move past end column when moving blocks horizontally, (true/false)
                move_past_end_col = false,
            }
        end
    },

}