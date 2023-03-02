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


-- language servers
servers = {
    pyright = {},
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<C-S-F>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

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
