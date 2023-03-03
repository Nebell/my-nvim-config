local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({ function(use)

    local theme = require('theme')
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary' -- commentary
    use({
        "kylechui/nvim-surround", tag = "*",
        config = function() require('utils').async_run(require("nvim-surround").setup) end,
        event = "BufReadPost",
    })
    -- status bar
    use { 'nvim-lualine/lualine.nvim', event = 'UIEnter', config = theme.lualine_setup }

    -- dashboard
    -- use {
    --     'goolord/alpha-nvim',
    --     config = function ()
    --         require'alpha'.setup(require'alpha.themes.dashboard'.config)
    --     end
    -- }

    -- theme
    use { 'projekt0n/github-nvim-theme', event = 'UIEnter', config = theme.github_setup }
    -- rainbow parenthese
    use { 'luochen1990/rainbow', event = "BufReadPre" }

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = theme.nvim_tree_setup
    }

    use { 'akinsho/bufferline.nvim', tag = "v3.*",
        event = "BufReadPre",
        requires = {
            'nvim-tree/nvim-web-devicons',
            -- delete a buffer without mess up the layout
            { 'famiu/bufdelete.nvim', module = 'bufferline' },
        },
        config = theme.bufferline_setup }

    -- fuzzy search
    use { 'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
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
    }

    -- git diff
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', event = "BufReadPost" }

    -- terminal
    use { 'voldikss/vim-floaterm', cmd = "FloatermToggle" } -- float terminal
    -- use 'skywind3000/vim-terminal-help' -- terminal

    -- debug
    -- use 'puremourning/vimspector'

    -- function argument modifier
    use { 'vim-scripts/argtextobj.vim', event = "BufReadPost" }

    -- motion
    use { 'ggandor/leap.nvim', key = 'f', config = function() require('leap') end }

    -- git signs for buffer
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('utils').async_run(require('gitsigns').setup) end,
        event = "BufReadPost",
    }

    -- LSP
    use { 'neovim/nvim-lspconfig', event = "BufReadPre", config = function() require('lsp.setup').setup() end }
    use { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', module = 'mason' }
    use({ "glepnir/lspsaga.nvim", branch = "main", after = 'nvim-lspconfig',
        event = "BufReadPre", cmd = "Lspsaga", module = 'lspsaga',
        config = function() require('lsp.setup').lspsaga_setup() end ,
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" }
        }
    })

    -- highlight and code structure
    use { 'nvim-treesitter/nvim-treesitter', event = "BufReadPost",
        run = ":TSUpdate", config = require('lsp.treesitter').setup }
    -- use { 'nvim-treesitter/nvim-treesitter-context', event = "BufReadPost", after = 'nvim-treesitter',
    --     config = function() require('utils').async_run(
    --             require('treesitter-context').setup)
    --     end }

    use { 'windwp/nvim-autopairs', event = "InsertEnter",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- autocompletion
    use { 'hrsh7th/nvim-cmp', event = "UIEnter", module = { 'cmp_nvim_lsp', 'cmp' },
        config = function() require('lsp.nvim-cmp').setup() end }
    -- nvim-cmp plugins, run after nvim-cmp
    use { after = 'nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
    }

    -- snippet
    use { after = 'nvim-cmp', event = "InsertEnter",
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end,
    config = {
        auto_clean = true, -- During sync(), remove unused plugins
        compile_on_sync = true, -- During sync(), run packer.compile()
        git = {
            depth = 1, -- Git clone depth
            clone_timeout = 60, -- Timeout, in seconds, for git clones
            default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
        },
    } })
