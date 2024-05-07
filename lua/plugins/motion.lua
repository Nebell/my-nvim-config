return {
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

    --------- operate motion ------------
    {
        "folke/flash.nvim",
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S", mode = { "o", "x" },      function() require("flash").treesitter() end,        desc =
            "Flash Treesitter" },
            { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end,
                                                                                                      desc =
                "Treesitter Search" },
        },
    }
}
