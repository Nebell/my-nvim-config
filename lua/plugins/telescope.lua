-- load extensions
local function load_extension()
    require('telescope').load_extension('projects')
end

local function check_fzf_compile()
    -- check compiler
    if vim.fn.has("win32") ~= 0 and (vim.fn.executable("mingw32-make") == 0 and vim.fn.executable("make") == 0) then
        return false
    elseif vim.fn.has("win32") == 0 and vim.fn.executable("make") == 0 then
        return false
    end

    -- check compiled
    local path_prefix = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim/build/"
    if 0 ~= vim.fn.filereadable(path_prefix .. "libfzf.dll") then
        return true
    elseif 0 ~= vim.fn.filereadable(path_prefix .. "libfzf.so") then
        return true
    end
    return false
end

---------- fuzzy search -------------
return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = "Telescope",
        module_pattern = 'telescope.*',
        config = function()
            -- fuzzy search
            local mapping = {
                ["<C-j>"] = {
                    require('telescope.actions').move_selection_next,
                    type = "action",
                    opts = { nowait = true, silent = true }
                },
                ["<C-k>"] = {
                    require('telescope.actions').move_selection_previous,
                    type = "action",
                    opts = { nowait = true, silent = true }
                }
            }

            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = mapping,
                        n = mapping
                    },
                },
                extensions = {
                },
            })

            load_extension()
        end,
        keys = {
            { "<Space>t", "<CMD>Telescope<CR>",                           mode = { "n", "v" },      { silent = true } },
            { "<C-P>",    "<CMD>Telescope find_files<CR>",                mode = { "n", "v", "i" }, { silent = true } },
            { "<Space>f", "<CMD>Telescope current_buffer_fuzzy_find<CR>", mode = { "n", "v" },      { silent = true } },
            { "<Space>F", "<CMD>Telescope live_grep<CR>",                 mode = { "n", "v" },      { silent = true } },
            { "<Space>j", "<CMD>Telescope jumplist<CR>",                  mode = { "n", "v" },      { silent = true } },
            -- { "<Space>b", "<CMD>Telescope buffers<CR>",                   mode = { "n", "v" },      { silent = true } },
            { "<Space>s", "<CMD>Telescope lsp_document_symbols<CR>",      mode = { "n", "v" },      { silent = true } },
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = check_fzf_compile,
        ft = require('common').dashboard_ft,
        build = 0 ~= vim.fn.has('win32') and 'mingw32-make' or 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end,
    },
    {
        "smartpde/telescope-recent-files",
        config = function()
            require("telescope").load_extension("recent_files")
        end,
        keys = {
            { "<Space>b", "<CMD>lua require('telescope').extensions.recent_files.pick() <CR>", mode = { "n", "v" }, { silent = true } },
        }
    },
}
