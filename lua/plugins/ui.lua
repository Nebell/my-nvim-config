local theme = require('theme')
return {
    ---------- status bar -------------
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = { 'SmiteshP/nvim-navic' },
        config = theme.lualine_setup
    },
    {
        'SmiteshP/nvim-navic',
        dependencies = "neovim/nvim-lspconfig",
        module = "nvim-navic",
    },

    ---------- dashboard -------------
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = require('theme').dashboard_setup,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },

    ---------- theme -------------
    {
        'rmehri01/onenord.nvim',
        event = "UIEnter",
        config = theme.theme_setup
    },

    ---------- file explorer -------------
    {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = theme.nvim_tree_setup,
        keys = {
            { "<C-G>",       "<CMD>NvimTreeToggle<CR>",   mode = { "n", "i", "v" }, { silent = true } },
            { "<Leader>loc", "<CMD>NvimTreeFindFile<CR>", mode = { "n", "i", "v" }, { silent = true } },
        }
    },

    ---------- tabline -------------------
    {
        'akinsho/bufferline.nvim',
        version = "v3.*",
        event = "BufReadPre",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            -- delete a buffer without mess up the layout
            { 'famiu/bufdelete.nvim', module = 'bufferline' },
        },
        config = theme.bufferline_setup,
        keys = {
            { "<A-Left>",  "<cmd>BufferLineCyclePrev<CR>", mode = { "n", "v", "i" }, { silent = true } },
            { "<A-Right>", "<cmd>BufferLineCycleNext<CR>", mode = { "n", "v", "i" }, { silent = true } },
            { "<C-H>",     "<cmd>BufferLineCyclePrev<CR>", mode = { "n", "v", "i" }, { silent = true } },
            { "<C-L>",     "<cmd>BufferLineCycleNext<CR>", mode = { "n", "v", "i" }, { silent = true } },
        }
    },

    ---------- rainbow parenthese -------------
    { 'luochen1990/rainbow', event = "BufReadPost" },
}
