vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function setup()
    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = false,
        update_focused_file = {
            enable = true,
            update_root = true
        },
        view = {
            width = 23,
        }
    })
end

-- auto close
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#ppwwyyxx
-- vim.api.nvim_create_autocmd("QuitPre", {
--     callback = function()
--         local invalid_win = {}
--         local wins = vim.api.nvim_list_wins()
--         for _, w in ipairs(wins) do
--             local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
--             if bufname:match("NvimTree_") ~= nil then
--                 table.insert(invalid_win, w)
--             end
--         end
--         if #invalid_win == #wins - 1 then
--             -- Should quit, so we close all invalid windows.
--             for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
--         end
--     end
-- })
--

---------- file explorer -------------
return {
    'nvim-tree/nvim-tree.lua',
    cmd = "NvimTreeToggle",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = setup,
    keys = {
        { "<C-G>",       "<CMD>NvimTreeToggle<CR>",   mode = { "n", "i", "v" }, { silent = true } },
        { "<Leader>loc", "<CMD>NvimTreeFindFile<CR>", mode = { "n", "v" },      { silent = true } },
    }
}
