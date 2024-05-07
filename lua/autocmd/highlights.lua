vim.api.nvim_create_augroup("custom.highlights", {clear = true})

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    group    = 'custom.highlights',
    pattern  = '*',
    callback = function() vim.highlight.on_yank { timeout = 200 } end
})
