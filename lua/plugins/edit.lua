return {
    {
        "cshuaimin/ssr.nvim",
        module = true,
        opts = {
            border = "rounded",
            min_width = 50,
            min_height = 5,
            max_width = 120,
            max_height = 25,
            adjust_window = true,
            keymaps = {
                close = "q",
                next_match = "n",
                prev_match = "N",
                replace_confirm = "<cr>",
                replace_all = "<leader><cr>",
            },
        },

        keys = {
            { "<Leader>sr", mode = { 'n', 'x' }, function() require("ssr").open() end, desc = "ssr.nvim" }
        },


        dependencies = 'nvim-treesitter',
        build = function()
            vim.cmd("TSInstall lua")
        end
    }
}
