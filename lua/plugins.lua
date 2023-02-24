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

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary' -- commentary
    use 'tpope/vim-surround' -- surround e.g. () []
    -- use 'itchyny/lightline.vim' -- status bar
    use { 'nvim-lualine/lualine.nvim' }

    -- coc.nvim
    use {'neoclide/coc.nvim', branch = 'release' }

    -- theme
    use ({ 'projekt0n/github-nvim-theme' })

    -- rainbow parenthese
    use 'luochen1990/rainbow'

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    }

    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- fuzzy search
    -- use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
    -- use {'ibhagwan/fzf-lua', requires = 'junegunn/fzf'}
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- git diff
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- terminal 
    use 'voldikss/vim-floaterm'  -- float terminal
    use 'skywind3000/vim-terminal-help' -- terminal

    -- debug
    use 'puremourning/vimspector'

    -- function argument modifier
    use 'vim-scripts/argtextobj.vim'

    -- motion
    use 'ggandor/leap.nvim'

    -- symbol outline
    use {'liuchengxu/vista.vim'}

    -- git signs for buffer
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end,
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
