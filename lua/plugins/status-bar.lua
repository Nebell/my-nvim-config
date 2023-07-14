------------------- lualine & navic -------------------

-- use treesitter to generate context line in bar
-- local function context_line()
--     return vim.fn['nvim_treesitter#statusline']({
--         indicator_size = 100,
--         type_patterns = { 'class', 'function', 'method', 'parameter' },
--         transform_fn = function(line, _node)
--             return line:gsub('%s*[%[%(%{]*%s*$', '')
--         end,
--         separator = '  ',
--         allow_duplicates = false
--     })
-- end

local navic_config = {
    lsp = {
        auto_attach = true,
        preference = nil,
    },
    highlight = true,
    separator = "  ",
    depth_limit = 3,
    depth_limit_indicator = "..",
    safe_output = true,
}

local lualine_config = {
    options = {
        icons_enabled = true,
        theme = 'wombat',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = require('common').ignore_ft,
            winbar = require('common').ignore_ft,
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        -- lualine_c = { 'filename', context_line },
        lualine_c = { 'filename', },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename', },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

local function lualine_setup()
    require('utils').async_run(function()
        -- attach context status
        local cfg = lualine_config
        local navic = require('nvim-navic')
        navic.setup(navic_config)

        local lualine_c = {
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            },
        }
        cfg.sections.lualine_c = lualine_c
        -- cfg.inactive_sections.lualine_c = lualine_c
        require('lualine').setup(cfg)
    end)
end

return {
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = { 'SmiteshP/nvim-navic' },
        config = lualine_setup,
    },
    {
        'SmiteshP/nvim-navic',
        dependencies = "neovim/nvim-lspconfig",
        module = "nvim-navic",
    },
}
