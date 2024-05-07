---------- git signs for buffer -------------
return {
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('utils').async_run(require('gitsigns').setup) end,
        event = "BufReadPost",
    },

    ---------- git diff -------------
    {
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        event = "BufReadPost"
    },

    ---------- git branchs ----------
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true,
        cmd = "Neogit",
        keys = {
<<<<<<< HEAD
            { "gv", function() require('neogit').open({ kind = "split" }) end,
                { 'n', 'v' }, { slient = true, noremap = true } },
            { "gp", function() require('neogit').open({ "commit" }) end,
                { 'n', 'v' }, { slient = true, noremap = true } },
=======
            {"gv", function () require('neogit').open({ kind = "auto" }) end, {'n', 'v'}, {slient = true, noremap = true}},
            {"gm", function () require('neogit').open({ "commit" }) end, {'n', 'v'}, {slient = true, noremap = true}},
>>>>>>> ee993d4 (change neogit keys)
        }
    }
}
