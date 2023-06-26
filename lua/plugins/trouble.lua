---------- quickfix diagnostics -------------
return {
    "folke/trouble.nvim",
    -- event = "BufReadPost",
    cmd = "TroubleToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { '<Leader>dw', "<CMD>TroubleToggle workspace_diagnostics<CR>" },
        { '<Leader>dd', "<CMD>TroubleToggle document_diagnostics<CR>" },
    },
}
