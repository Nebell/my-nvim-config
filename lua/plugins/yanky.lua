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
            -- not in a SSH connection
            if not os.getenv('SSH_CLIENT') then
                yanky_config.system_clipboard.sync_with_ring = true
                vim.api.nvim_set_option("clipboard", "unnamedplus")
            end
            require("yanky").setup(yanky_config)
        end,
    },
    {
        'ojroques/nvim-osc52',
        event = "TextYankPost",
        init = function()
            local copy = function()
                -- if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
                --     require('osc52').copy_register('+')
                -- end

                require('osc52').copy_register('0')
            end

            vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })
        end,
        config = function()
            require('osc52').setup {
                max_length = 0,           -- Maximum length of selection (0 for no limit)
                silent = true,           -- Disable message on successful copy
                trim = true,             -- Trim surrounding whitespaces before copy
                tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
            }
        end
    },
}
