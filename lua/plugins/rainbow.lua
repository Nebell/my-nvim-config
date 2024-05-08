local function setup_colors()
    vim.cmd([[highlight TSRainbowRed guifg=#8491c3 ctermfg=LightBlue ]])
    vim.cmd([[highlight TSRainbowYellow guifg=#698aab ctermfg=Brown ]])
    vim.cmd([[highlight TSRainbowBlue guifg=#4699C9 ctermfg=Cyan ]])
    vim.cmd([[highlight TSRainbowOrange guifg=#339999 ctermfg=Brown ]])
    -- vim.cmd([[highlight TSRainbowGreen guifg= ctermfg=]])
    vim.cmd([[highlight TSRainbowViolet guifg=#93b881 ctermfg=White ]])
    vim.cmd([[highlight TSRainbowCyan guifg=#CCCCCC ctermfg=Cyan ]])
end

return {
    {
        "hiphish/rainbow-delimiters.nvim",
        -- enabled = false,
        event = "BufReadPost",
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        config = function()
            -- This module contains a number of default definitions
            local rainbow_delimiters = require 'rainbow-delimiters'

            setup_colors()
            ---@type rainbow_delimiters.config
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    -- lua = 'rainbow-blocks',
                },
                priority = {
                    [''] = 110,
                    -- lua = 210,
                },
                highlight = {
                    -- 'RainbowDelimiterRed',
                    -- 'RainbowDelimiterYellow',
                    -- 'RainbowDelimiterBlue',
                    -- 'RainbowDelimiterOrange',
                    -- 'RainbowDelimiterGreen',
                    -- 'RainbowDelimiterViolet',
                    -- 'RainbowDelimiterCyan',
                    'TSRainbowRed',
                    'TSRainbowYellow',
                    'TSRainbowBlue',
                    'TSRainbowOrange',
                    'TSRainbowViolet',
                    'TSRainbowCyan',
                },
            }
        end
    },
}
