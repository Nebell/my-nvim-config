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

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary' -- commentary
    use({
        "kylechui/nvim-surround", tag = "*",
        config = function() require("nvim-surround").setup() end,
        event = "BufReadPost",
    })
    -- use 'itchyny/lightline.vim' -- status bar
    use { 'nvim-lualine/lualine.nvim' }

    -- coc.nvim
    use {'neoclide/coc.nvim', branch = 'release',
        event = "VimEnter",
    }

    -- theme
    use ({ 'projekt0n/github-nvim-theme' })

    -- rainbow parenthese
    use 'luochen1990/rainbow'

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("nvim-tree").setup({
                view = {
                    width = 23,
                }
            })
        end,
    }

    use {'akinsho/bufferline.nvim', tag = "v3.*", 
        event = "VimEnter",
        requires = { 
            'nvim-tree/nvim-web-devicons',
            'famiu/bufdelete.nvim',     -- delete a buffer without mess up the layout
        },
        config = function() 
            local bufclose = function(bufnum) require('bufdelete').bufdelete(bufnum, true) end
            require("bufferline").setup{
                options = {
                    diagnostics = {"coc" , "nvim_lsp"},
                    offsets = {{
                        filetype = "NvimTree",
                        text = function() return vim.fn.getcwd() end,
                        highlight = "Directory",
                        text_align = "left"
                    }},
                    close_command = bufclose, 
                    right_mouse_command = bufclose, 
                    left_mouse_command = "buffer %d",   
                    middle_mouse_command = bufclose,
                    always_show_bufferline = true, 
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'}
                    },
                    indicator = {
                        style = "none"
                    }
                }
            }
        end
    }

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
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- terminal 
    use { 'voldikss/vim-floaterm',
        cmd = "FloatermToggle"
    }  -- float terminal
    -- use 'skywind3000/vim-terminal-help' -- terminal

    -- debug
    -- use 'puremourning/vimspector'

    -- function argument modifier
    use 'vim-scripts/argtextobj.vim'

    -- motion
    use { 'ggandor/leap.nvim', 
        config = function() require('leap') end,
        module = 'leap',
    }

    -- symbol outline
    use { 'liuchengxu/vista.vim' }

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
