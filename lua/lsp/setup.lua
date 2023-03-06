local M = {}

local utils = require('utils')

-- mason config
local mason_config = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

-- mason-lspconfig config
local mason_lsp_config = {
    automatic_installation = true,
    ensure_installed = {}
}

-- setup mason
local function mason_setup()
    require("mason").setup(mason_config)
    require("mason-lspconfig").setup(mason_lsp_config)
end

M.mason_setup = mason_setup


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

end

-- setup lspconfig and plugins
function M.setup()
    utils.async_run(mason_setup)
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
end

local lspsaga_config = {
    symbol_in_winbar = { enable = false },
}

-- Lspsaga setup
function M.lspsaga_setup()
    require("lspsaga").setup(lspsaga_config)
end

return M
