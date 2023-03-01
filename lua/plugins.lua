local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local keyset = vim.keymap.set
local util = require('packer.util')
local theme = require('theme')

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary' -- commentary
    use({
        "kylechui/nvim-surround", tag = "*",
        config = function() require("nvim-surround").setup() end,
        event = "BufReadPost",
    })
    -- status bar
    use { 'nvim-lualine/lualine.nvim', event = 'UIEnter', config = theme.lualine_setup }
    -- coc.nvim
    -- use {'neoclide/coc.nvim', branch = 'release',
    --     event = "VimEnter",
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
        config = theme.nvim_tree_setup }

    use {'akinsho/bufferline.nvim', tag = "v3.*", 
        event = "BufReadPre",
        requires = { 
            'nvim-tree/nvim-web-devicons',
            -- delete a buffer without mess up the layout
            {'famiu/bufdelete.nvim', module = 'bufdelete'},
        },
        config = theme.bufferline_setup }

    -- fuzzy search
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' },
        cmd = "Telescope",
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

            require('telescope').setup{
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
    use { 'voldikss/vim-floaterm', cmd = "FloatermToggle" }  -- float terminal
    -- use 'skywind3000/vim-terminal-help' -- terminal

    -- debug
    -- use 'puremourning/vimspector'

    -- function argument modifier
    use { 'vim-scripts/argtextobj.vim', event = "BufReadPost" }

    -- motion
    use { 'ggandor/leap.nvim', key = 'f', config = function() require('leap') end }

    -- symbol outline
    use { 'liuchengxu/vista.vim', event = "BufReadPost"}

    -- git signs for buffer
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end,
        event = "BufReadPre",
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
}})
