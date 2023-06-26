return {
    "kylechui/nvim-surround",
    -- version = "*",
    config = function() require('utils').async_run(require("nvim-surround").setup) end,
    event = "BufReadPost",
}
