local M = {}

local theme = require('theme')
local plugins = {
    { 'tpope/vim-commentary', event = "BufReadPost" }, -- commentary
    {
        "kylechui/nvim-surround",
        -- version = "*",
        config = function() require('utils').async_run(require("nvim-surround").setup) end,
        event = "BufReadPost",
    },
    -- status bar
    { 'nvim-lualine/lualine.nvim', event = "VeryLazy", config = theme.lualine_setup },

    -- dashboard
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = require('theme').dashboard_setup,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },

    -- theme
    { 'rmehri01/onenord.nvim', event = "VeryLazy", config = theme.theme_setup },
    -- rainbow parenthese
    { 'luochen1990/rainbow', event = "BufReadPre" },

    -- file explorer
    {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = theme.nvim_tree_setup
    },

    {
        'akinsho/bufferline.nvim',
        version = "v3.*",
        event = "BufReadPre",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            -- delete a buffer without mess up the layout
            { 'famiu/bufdelete.nvim', module = 'bufferline' },
        },
        config = theme.bufferline_setup
    },

    -- fuzzy search
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kdheepak/lazygit.nvim',
        },
        cmd = "Telescope",
        module_pattern = 'telescope.*',
        config = function()
            -- fuzzy search
            local mapping = {
                ["<C-j>"] = {
                    require('telescope.actions').move_selection_next, type = "action",
                    opts = { nowait = true, silent = true }
                },
                ["<C-k>"] = {
                    require('telescope.actions').move_selection_previous, type = "action",
                    opts = { nowait = true, silent = true }
                }
            }

            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = mapping,
                        n = mapping
                    }
                },
                extensions = {
                },
            })
        end,
    },

    -- git diff
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim', event = "BufReadPost" },

    -- terminal
    { 'akinsho/toggleterm.nvim', version = "*", event = "VeryLazy", opts = {
        direction = "float",
    } },

    -- debug
    -- 'puremourning/vimspector'

    -- function argument modifier
    { 'vim-scripts/argtextobj.vim', event = "BufReadPost" },

    -- motion
    { 'ggandor/leap.nvim', event = "BufReadPost", keys = {
        { "f", "<Plug>(leap-forward-to)" },
        { "F", "<Plug>(leap-backward-to)" },
    }, config = function() require('leap') end },

    -- git signs for buffer
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('utils').async_run(require('gitsigns').setup) end,
        event = "BufReadPost",
    },

    -- LSP
    { 'neovim/nvim-lspconfig', event = "BufReadPre", config = function() require('lsp.setup').setup() end },
    { 'williamboman/mason.nvim', event = "VeryLazy" },
    { 'williamboman/mason-lspconfig.nvim', event = "VeryLazy", dependencies = 'williamboman/mason.nvim' },
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        cmd = "Lspsaga",
        config = function() require('lsp.setup').lspsaga_setup() end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" },
            { "neovim/nvim-lspconfig" },
        }
    },
    {
        'simrat39/symbols-outline.nvim',
        event = "BufReadPost",
        config = function() require("symbols-outline").setup() end,
        keys = { { "<C-S>", "<cmd>SymbolsOutline<CR>", { silent = true, noremap = true } } }
    },
    {
        'ray-x/lsp_signature.nvim',
        config = function()
            require "lsp_signature".setup({})
        end,
    },

    -- highlight and code structure
    {
        'nvim-treesitter/nvim-treesitter',
        event = "BufReadPost",
        build = ":TSUpdate",
        config = require('lsp.treesitter').setup
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = "BufReadPost",
        dependencies = 'nvim-treesitter',
        config = function()
            require('utils').async_run(
                require('treesitter-context').setup)
        end
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function() require("nvim-autopairs").setup {} end
    },

    -- autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = "VeryLazy",
        module = { 'cmp_nvim_lsp', 'cmp' },
        config = function() require('lsp.nvim-cmp').setup() end,
        -- nvim-cmp plugins, run dependenciesnvim-cmp
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
    },

    -- snippet
    {
        'hrsh7th/cmp-nvim-lua',
        dependencies = 'hrsh7th/nvim-cmp',
        event = "InsertEnter",
    },
    {
        'hrsh7th/cmp-vsnip',
        event = "BufRead",
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
        }
    },
}

local lazy_config = {
    defaults = {
        lazy = true,
    },
    git = {
        url_format = "https://github.com/%s.git",
    },
    install = {
        missing = true,
    }
}

function M.setup()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    require('lazy').setup(plugins, lazy_config)
end

return M
