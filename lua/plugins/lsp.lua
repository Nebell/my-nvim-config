-- mason config
local mason_config = {
    -- The directory in which to install packages.
    -- install_root_dir = require "mason-core.path".concat { vim.fn.stdpath "data", "mason" },
    install_root_dir = vim.fn.stdpath "data" .. "mason",
    -- Where Mason should put its bin location in your PATH. Can be one of:
    -- - "prepend" (default, Mason's bin location is put first in PATH)
    -- - "append" (Mason's bin location is put at the end of PATH)
    -- - "skip" (doesn't modify PATH)
    ---@type '"prepend"' | '"append"' | '"skip"'
    PATH = "prepend",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://" .. vim.g.git_src_host .. "/%s/releases/download/%s/%s",
    },
    pip = {
        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
        upgrade_pip = false,
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },
}

-- mason-lspconfig config
local mason_lsp_config = {
    automatic_installation = false,
    ensure_installed = {}
}

local lspsaga_config = {
    symbol_in_winbar = { enable = false },
    callhierarchy = {
        show_detail = false,
        keys = {
            edit = "e",
            vsplit = "s",
            split = "i",
            tabe = "t",
            jump = "<CR>",
            quit = "q",
            expand_collapse = "u",
        },
    },
    finder = {
        max_height = 0.5,
        left_width = 0.3,
        right_width = 0.5,
        methods = {},
        default = 'ref+imp',
        layout = 'float',
        silent = false,
        filter = {},
        sp_inexist = false,
        keys = {
            shuttle = '[w',
            toggle_or_open = '<CR>',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close = '<C-c>k',
        },
    },
    lightbulb = {
        enable = true,
        sign = false,
        debounce = 10,
        sign_priority = 40,
        virtual_text = true,
        enable_in_insert = true,
    },
    ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = " ",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {},
    },
}


---------- LSP -------------
return {
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        config = function()
            require("mason").setup(mason_config)
            require("mason-lspconfig").setup(mason_lsp_config)
            require('lsp.setup').setup()
        end,
        dependencies = { 'nvimdev/lspsaga.nvim' },
    },
    {
        'williamboman/mason.nvim',
        event = "VeryLazy",
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
        config = function() require("lspsaga").setup(lspsaga_config) end,
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
