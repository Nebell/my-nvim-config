return {
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        opts = {
            server = {
                -- standalone file support
                -- setting it to false may improve startup time
                standalone = false,
            },
            tools = {
                -- These apply to the default RustSetInlayHints command
                inlay_hints = {
                    -- automatically set inlay hints (type hints)
                    -- default: true
                    auto = true,

                    -- Only show inlay hints for the current line
                    only_current_line = false,

                    -- whether to show parameter hints with the inlay hints or not
                    -- default: true
                    show_parameter_hints = true,

                    -- prefix for parameter hints
                    -- default: "<-"
                    parameter_hints_prefix = " ",

                    -- prefix for all the other hints (type, chaining)
                    -- default: "=>"
                    other_hints_prefix = ": ",

                    -- whether to align to the length of the longest line in the file
                    max_len_align = false,

                    -- padding from the left if max_len_align is true
                    max_len_align_padding = 1,

                    -- whether to align to the extreme right or not
                    right_align = false,

                    -- padding from the right if right_align is true
                    right_align_padding = 7,

                    -- The color of the hints
                    highlight = "Comment",
                },
            }
        }
    },
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        -- event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        -- build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
        build = ':lua require("go.install").update_all()' -- if you need to install/update all binaries
    },
}
