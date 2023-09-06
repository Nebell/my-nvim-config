local yanky_config = {
    ring = {
        history_length = 100,
        storage = "memory",
        sync_with_numbered_registers = true,
        cancel_event = "update",
    },
    picker = {
        select = {
            action = nil, -- nil to use default put action
        },
        telescope = {
            use_default_mappings = true, -- if default mappings should be used
            mappings = nil,              -- nil to use default mappings or no mappings (see `use_default_mappings`)
        },
    },
    system_clipboard = {
        sync_with_ring = false,
    },
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 300,
    },
    preserve_cursor_position = {
        enabled = false,
    },
}

return {
    {
        'gbprod/yanky.nvim',
        event = "BufReadPost",
        config = function()
            if nil ~= os.getenv('SSH_CLIENT') then
                yanky_config.system_clipboard.sync_with_ring = true
                vim.api.nvim_set_option("clipboard", "unnamedplus")
            end
            require("yanky").setup(yanky_config)
        end,
    }
}
