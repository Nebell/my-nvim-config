---------- highlight and code structure -------------

-- config
local treesitter_config = {
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    ensure_installed = { "lua", "go", "python", "markdown", "markdown_inline" },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,
    highlight = {
        enable = true,
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = {},
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        -- disable = function(lang, buf)
        disable = function(_, buf)
            local max_filesize = 100 * 1024 * 1024 -- 100 MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        }
    },
}

local function setup()
    -- use global github proxy
    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
        config.install_info.url = config.install_info.url:gsub("https://github.com/",
            "https://" .. vim.g.git_src_host .. "/")
    end

    require('utils').async_run(function()
        -- compilers
        local compilers = { vim.fn.getenv('CC'), "cc", "gcc", "clang", "cl", "zig" }
        if nil ~= string.find(vim.loop.os_uname().sysname, "Windows") then
            compilers = { "zig", "clang", vim.fn.getenv('CC'), "gcc" }
        end

        require("nvim-treesitter.install").prefer_git = true
        require 'nvim-treesitter.install'.compilers = compilers
        require('nvim-treesitter.configs').setup(treesitter_config)
    end)
end


local treesitter_textobj_config = {
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
        },
    },

    swap = {
        enable = true,
        swap_next = {
            ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
            ["<leader>A"] = "@parameter.inner",
        },
    },

    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
            --
            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
            ["]o"] = "@loop.*",
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            --
            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
        },
        goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
        },
        goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
        },
        -- Below will go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        -- Make it even more gradual by adding multiple queries and regex.
        goto_next = {
            ["]d"] = "@conditional.outer",
        },
        goto_previous = {
            ["[d"] = "@conditional.outer",
        }
    },
}


return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = "BufReadPost",
        build = ":TSUpdate",
        config = setup
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = "BufReadPost",
        dependencies = 'nvim-treesitter',
        config = function()
            require('utils').async_run(
                require('treesitter-context').setup)
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        event = "BufReadPost",
        dependencies = 'nvim-treesitter',
        config = function()
            require 'nvim-treesitter.configs'.setup(treesitter_textobj_config)
        end
    }
}
