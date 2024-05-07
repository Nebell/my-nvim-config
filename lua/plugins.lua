local M = {}

local theme = require('theme')
local plugins = {
    --------- comment ------------
    {
        'numToStr/Comment.nvim',
        event = "BufReadPost",
        config = function()
            require('Comment').setup()
        end
    },
    {
        "kylechui/nvim-surround",
        -- version = "*",
        config = function() require('utils').async_run(require("nvim-surround").setup) end,
        event = "BufReadPost",
    },
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
    { 'rmehri01/onenord.nvim', event = "UIEnter",   config = theme.theme_setup },
    ---------- rainbow parenthese -------------
    { 'luochen1990/rainbow',   event = "BufReadPre" },

    ---------- file explorer -------------
    {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
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

    ---------- fuzzy search -------------
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

    ---------- git diff -------------
    { 'sindrets/diffview.nvim',     dependencies = 'nvim-lua/plenary.nvim', event = "BufReadPost" },

    ---------- terminal -------------
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = "VeryLazy",
        opts = {
            direction = "float",
        }
    },

    ---------- debug -------------
    -- 'puremourning/vimspector'

    ---------- function argument modifier -------------
    { 'vim-scripts/argtextobj.vim', event = "BufReadPost" },

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


    ---------- which key -------------
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    ---------- git signs for buffer -------------
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('utils').async_run(require('gitsigns').setup) end,
        event = "BufReadPost",
    },

    ---------- LSP -------------
    { 'neovim/nvim-lspconfig',             event = "BufReadPre", config = function() require('lsp.setup').setup() end },
    { 'williamboman/mason.nvim',           event = "VeryLazy" },
    { 'williamboman/mason-lspconfig.nvim', event = "VeryLazy",   dependencies = 'williamboman/mason.nvim' },
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
    {
        "rust-lang/rust.vim",
        ft = "rs",
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

    ---------- highlight and code structure -------------
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

    ---------- autocompletion -------------
    {
        'hrsh7th/nvim-cmp',
        event = "VeryLazy",
        module = { 'cmp_nvim_lsp', 'cmp' },
        config = function() require('lsp.nvim-cmp').setup() end,
        -- nvim-cmp plugins, run dependenciesnvim-cmp
        dependencies = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
    },
    {
        'hrsh7th/cmp-buffer',
        event = "BufReadPost",
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        dependencies = {
            'hrsh7th/nvim-cmp',
            'neovim/nvim-lspconfig',
        }
    },

    ---------- snippet -------------
    {
        'hrsh7th/cmp-nvim-lua',
        dependencies = 'hrsh7th/nvim-cmp',
        event = "InsertEnter",
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "1.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = {
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        }
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

    ---------- auto-save -------------
    {
        "Pocco81/auto-save.nvim",
        event = "InsertEnter",
        config = function()
            require("auto-save").setup({})
        end,
    },

    ---------- undo tree -------------
    {
        'mbbill/undotree',
        -- event = "TextChanged",
        cmd = "UndotreeToggle",
        keys = { { "<Leader>u", vim.cmd.UndotreeToggle } },
    },

    ---------- quickfix diagnostics -------------
    {
        "folke/trouble.nvim",
        -- event = "BufReadPost",
        cmd = "TroubleToggle",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { '<Leader>dw', "<CMD>TroubleToggle workspace_diagnostics<CR>" },
            { '<Leader>dd', "<CMD>TroubleToggle document_diagnostics<CR>" },
        },
    },
}

-- github domain, or change it to a mirror domain
local git_src_url = "github.com"

local lazy_config = {
    defaults = {
        lazy = true,
    },
    git = {
        url_format = "https://" .. git_src_url .. "/%s.git",
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
            "https://" .. git_src_url .. "/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    require('lazy').setup(plugins, lazy_config)
end

return M
