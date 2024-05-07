M = {}

function M.keybinding()
    local utils = require('utils')
    local keyset = vim.keymap.set

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keyset('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keyset('n', 'gd', vim.lsp.buf.definition, bufopts)
    keyset('n', 'gr', vim.lsp.buf.references, bufopts)
    keyset('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keyset('n', 'gf', function() vim.lsp.buf.format { async = true } end, bufopts)
    keyset('n', 'K', utils.async(vim.lsp.buf.hover), bufopts)
    keyset('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    keyset('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)

    local opts = { noremap=true, silent=true }
    keyset('n', '<Leader>d', vim.diagnostic.open_float, opts)
    keyset('n', 'gp', vim.diagnostic.goto_prev, opts)
    keyset('n', 'gn', vim.diagnostic.goto_next, opts)
    keyset('n', '<Leader>q', vim.diagnostic.setloclist, opts)
end

return M
