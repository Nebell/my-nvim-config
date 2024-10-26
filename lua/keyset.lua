local keymap = vim.keymap.set

local opts = { silent = true, noremap = true }
keymap({ "n", "v" }, "<C-K>", "15k", opts)
keymap({ "n", "v" }, "<C-J>", "15j", opts)

-- get current file path
local function show_current_file_path(arg)
    local file_path = vim.fn.expand('%:p')
    if file_path == "" then
        vim.api.nvim_echo({ { "No file path associated with." } }, true, {})
        return
    end

    if arg.args == "copy" then
        vim.fn.setreg('+', file_path)
        vim.api.nvim_echo({ { file_path .. " [Copied]" } }, true, {})
    else
        vim.api.nvim_echo({ { file_path } }, true, {})
    end
end

vim.api.nvim_create_user_command('FilePath', show_current_file_path, { nargs = '*' })

-- show file path of current buffer
keymap({ "n", "v" }, "<Leader>fp", show_current_file_path,
    { silent = true, noremap = true, desc = "Show file path of current buffer" })
