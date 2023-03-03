M = {}

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
    lua_ls = {},
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
    -- local cmp = require('cmp_nvim_lsp')
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

return M
