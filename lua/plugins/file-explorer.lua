local neotree_config = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    default_component_configs = {
        window = {
            position = "left",
            width = 25,
            auto_expand_width = true,
        }
    },
}

---------- file explorer -------------
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",            -- Optional image support in preview window: See `# Preview Mode` for more information
        },

        keys = {
            { "<C-G>", mode = { 'v', 'n', 'i' }, function() vim.cmd("Neotree toggle") end, desc = "Neotree" },
        },

        cmd = "Neotree",
        config = function()
            require("neo-tree").setup(neotree_config)
        end,
    }
}
