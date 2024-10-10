---------- quickfix diagnostics -------------
return {
    "folke/trouble.nvim",
    event = "BufReadPost",
    cmd = "TroubleToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { 'gE',         "<CMD>TroubleToggle workspace_diagnostics<CR>" },
        { 'ge',         "<CMD>TroubleToggle document_diagnostics<CR>" },
        { '<Leader>qf', "<CMD>TroubleToggle quickfix<CR>" },
        { 'gD',         "<CMD>TroubleToggle lsp_definitions<CR>" },
        { 'gR',         "<CMD>TroubleToggle lsp_references<CR>" },
    },
}
