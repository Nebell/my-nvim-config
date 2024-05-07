------------------- dashboard -------------------
local dashboard_config = {
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        shortcut = {
            { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'p',
            },
            {
                desc = ' dotfiles',
                group = 'Number',
                action = 'Telescope dotfiles',
                key = 'd',
            },
        },
    },
}

local function setup()
    require('dashboard').setup(dashboard_config)
end

return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = setup,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
