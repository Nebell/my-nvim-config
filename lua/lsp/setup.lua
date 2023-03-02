mod = {}

-- mason config
mason_config = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

-- mason-lspconfig config
mason_lsp_config = {
    automatic_installation = true,
    ensure_installed = {}
}

-- setup mason
function mason_setup()
    require("mason").setup(mason_config)
    require("mason-lspconfig").setup(mason_lsp_config)
end
mod.mason_setup = mason_setup


servers = {
    pyright = {},
}

-- setup lspconfig and plugins
function mod.setup()
    async = require('utils').async_run
    async(mason_setup)

    local lsp = require('lspconfig')
    for srv, cfg in pairs(servers) do
        if lsp[srv] ~= nil then
            async(function()
                lsp[srv].setup(cfg)
            end)
        end
    end
end

return mod
