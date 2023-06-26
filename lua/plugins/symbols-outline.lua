return {
    'simrat39/symbols-outline.nvim',
    event = "BufReadPost",
    config = function() require("symbols-outline").setup() end,
    keys = { { "<C-S>", "<cmd>SymbolsOutline<CR>", { silent = true, noremap = true } } }
}
