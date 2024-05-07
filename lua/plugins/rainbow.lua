return {
    {
        "HiPhish/nvim-ts-rainbow2",
        event = "BufReadPost",
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        init = function()
            vim.cmd([[highlight TSRainbowRed guifg=#8491c3 ctermfg=LightBlue ]])
            vim.cmd([[highlight TSRainbowYellow guifg=#698aab ctermfg=Brown ]])
            vim.cmd([[highlight TSRainbowBlue guifg=#4c6cb3 ctermfg=Cyan ]])
            vim.cmd([[highlight TSRainbowOrange guifg=#339999 ctermfg=Brown ]])
            -- vim.cmd([[highlight TSRainbowGreen guifg= ctermfg=]])
            vim.cmd([[highlight TSRainbowViolet guifg=#93b881 ctermfg=White ]])
            vim.cmd([[highlight TSRainbowCyan guifg=#CCCCCC ctermfg=Cyan ]])
        end,
        config = function()
            require('nvim-treesitter.configs').setup {
                rainbow = {
                    enable = true,
                    -- list of languages you want to disable the plugin for
                    disable = { 'jsx', 'cpp' },
                    -- Which query to use for finding delimiters
                    query = 'rainbow-parens',
                    -- Highlight the entire buffer all at once
                    -- strategy = require('ts-rainbow').strategy.global,
                    -- strategy = require('ts-rainbow').strategy.local,
                }
            }
        end
    },
}
