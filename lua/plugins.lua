local M = {}

local theme = require('theme')
local plugins = {
    { 'wbthomason/packer.nvim' },
    { 'tpope/vim-commentary' }, -- commentary
    {
        "kylechui/nvim-surround",
        version = "*",
        config = function() require('utils').async_run(require("nvim-surround").setup) end,
        event = "BufReadPost",
    },
    -- status bar
    { 'nvim-lualine/lualine.nvim',   event = 'UIEnter',   config = theme.lualine_setup },

    -- dashboard
    -- {
    --     'goolord/alpha-nvim',
    --     config = function ()
    --         require'alpha'.setup(require'alpha.themes.dashboard'.config)
    --     end
    -- }

    -- theme
    { 'projekt0n/github-nvim-theme', event = "VeryLazy",   config = theme.github_setup },
    -- rainbow parenthese
    { 'luochen1990/rainbow',         event = "BufReadPre" },

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
        dependencies = { 'nvim-lua/plenary.nvim' },
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

            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = mapping,
                        n = mapping
                    }
                },
                extensions = {
                },
            }
        end,
    },

    -- git diff
    { 'sindrets/diffview.nvim',     dependencies = 'nvim-lua/plenary.nvim', event = "BufReadPost" },

    -- terminal
    { 'voldikss/vim-floaterm',      cmd = "FloatermToggle" }, -- float terminal
    -- 'skywind3000/vim-terminal-help' -- terminal

    -- debug
    -- 'puremourning/vimspector'

    -- function argument modifier
    { 'vim-scripts/argtextobj.vim', event = "BufReadPost" },

    -- motion
    { 'ggandor/leap.nvim',          key = 'f',                              config = function() require('leap') end },

    -- git signs for buffer
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('utils').async_run(require('gitsigns').setup) end,
        event = "BufReadPost",
    },

    -- LSP
    { 'neovim/nvim-lspconfig',   event = "BufReadPre",                config = function() require('lsp.setup').setup() end },
    { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', module = 'mason' },
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        cmd = "Lspsaga",
        config = function() require('lsp.setup').lspsaga_setup() end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
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
        dependencies = 'nvim-cmp',
        event = "InsertEnter",
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
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
