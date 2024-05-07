---------- undo tree -------------
return {
    'mbbill/undotree',
    -- event = "TextChanged",
    cmd = "UndotreeToggle",
    keys = { { "<Leader>u", vim.cmd.UndotreeToggle } },
}
