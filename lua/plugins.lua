vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'preservim/nerdtree'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-surround'
    use 'itchyny/lightline.vim'
    use 'skywind3000/vim-terminal-help'

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

    -- float terminal
    use 'voldikss/vim-floaterm'

    -- debug
    use "puremourning/vimspector"
end)
