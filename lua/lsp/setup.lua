local M = {}

local utils = require('utils')

-- mason config
local mason_config = {
    -- The directory in which to install packages.
    install_root_dir = require "mason-core.path".concat { vim.fn.stdpath "data", "mason" },
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
    automatic_installation = true,
    ensure_installed = {}
}

-- language servers
local servers = {
    pyright = {},
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim', 'require' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    -- Disable the message asks to modify .luarc.json
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    rust_analyzer = {},
    gopls = {},
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    if client.server_capabilities.documentSymbolProvider then
        local navic = require("nvim-navic")
        navic.attach(client, bufnr)
    end
end

-- setup mason
local function mason_setup()
    require("mason").setup(mason_config)
    require("mason-lspconfig").setup(mason_lsp_config)
end

M.mason_setup = mason_setup

-- register autocmd
function M.set_autocmd()
    -- gopls auto imports
    vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
            vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
        end
    })
end

-- setup lspconfig and plugins
function M.setup()
    utils.async_run(mason_setup)
    utils.async_run(M.set_autocmd)
    require('lsp.keybinding').keybinding()

    local lsp = require('lspconfig')
    local cmp = require('cmp_nvim_lsp')
    local capabilities
    if cmp ~= nil then
        capabilities = cmp.default_capabilities()
    end
    for srv, cfg in pairs(servers) do
        if cfg.on_attach == nil then
            cfg.on_attach = on_attach
        end

        -- nvim-cmp
        cfg.capabilities = capabilities

        if lsp[srv] ~= nil then
            lsp[srv].setup(cfg)
        end
    end

    require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }
        end,

    }
end

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
        min_width = 30,
        force_max_height = false,
        keys = {
            jump_to = 'p',
            expand_or_jump = '<CR>',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>',
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

-- Lspsaga setup
function M.lspsaga_setup()
    require("lspsaga").setup(lspsaga_config)
end

return M
