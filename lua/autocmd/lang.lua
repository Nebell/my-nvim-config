-- auto imports
vim.api.nvim_create_autocmd('BufWritePre', {
    desc = "auto imports",
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    end
})

-- PHP auto-completion of '->' '=>'
-- vim.api.nvim_create_autocmd('FileType', {
--     desc = "auto completion",
--     pattern = 'php',
--     callback = function()
--         local has_words_before = function()
--             unpack = unpack or table.unpack
--             local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--             local c = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col)
--             return col ~= 0 and c:match("%s") == nil and c:match("-") == nil
--         end
--
--         local function append(c, t)
--             return function()
--                 vim.keymap.set('i', c, function()
--                     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--                     if not has_words_before() then
--                         print(line, col)
--                         vim.api.nvim_buf_set_text(0, line - 1, col, line - 1, col, { c })
--                         vim.api.nvim_win_set_cursor(0, { line, col + 1 })
--                         return
--                     end
--
--                     vim.api.nvim_buf_set_text(0, line - 1, col, line - 1, col, { t })
--                     vim.api.nvim_win_set_cursor(0, { line, col + vim.fn.strlen(t) })
--                 end, { noremap = true, silent = true, buffer = true })
--             end
--         end
--
--         append('-', '->')()
--         append('=', '=>')()
--     end
-- })
