---------- LSP -------------
return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        config = function() require('lsp.setup').setup() end,
        dependencies = { 'nvimdev/lspsaga.nvim'},
    },
    {
        'williamboman/mason.nvim',
        event = "VeryLazy"
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = "VeryLazy",
        dependencies = 'williamboman/mason.nvim'
    },
    {
        "nvimdev/lspsaga.nvim",
        branch = "main",
        cmd = "Lspsaga",
        config = function() require('lsp.setup').lspsaga_setup() end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" },
        }
    },
    {
        'ray-x/lsp_signature.nvim',
        event = "InsertEnter",
        keys = {
            { '<C-Space>', vim.lsp.buf.signature_help },
        },
        config = function()
            require "lsp_signature".setup({})
        end,
    },

}
