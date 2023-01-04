vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-commentary' -- commentary
    use 'tpope/vim-surround' -- surround e.g. () []
    use 'itchyny/lightline.vim' -- status bar

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
    use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}

    -- terminal 
    use 'voldikss/vim-floaterm'  -- float terminal
    use 'skywind3000/vim-terminal-help' -- terminal

    -- debug
    use 'puremourning/vimspector'

    -- function argument modifier
    use 'vim-scripts/argtextobj.vim'

    -- motion
    use 'ggandor/leap.nvim'
end)
