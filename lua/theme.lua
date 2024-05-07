Theme = {}

-- github theme
function Theme.theme_setup()
    local colors = require("onenord.colors").load()
    require('onenord').setup({
        theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        borders = true, -- Split window borders
        fade_nc = false, -- Fade non-current windows, making them more distinguishable
        -- Style that is applied to various groups: see `highlight-args` for options
        styles = {
            comments = "NONE",
            strings = "NONE",
            keywords = "NONE",
            functions = "NONE",
            variables = "NONE",
            diagnostics = "underline",
        },
        disable = {
            background = false, -- Disable setting the background color
            cursorline = false, -- Disable the cursorline
            eob_lines = true, -- Hide the end-of-buffer lines
        },
        -- Inverse highlight for different groups
        inverse = {
            match_paren = false,
        },
        custom_highlights = { -- Overwrite default highlight groups
            ["@string"] = { fg = "#B0BEC5"},
            ["@character"] = { fg = "#90A4AE" },
        },
        custom_colors = {}, -- Overwrite default colors
    })
end

-- rainbow parenthese
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
    -- gui color
    guifgs = { 'darkgray', 'lightslategray', 'lightskyblue', 'Cornflowerblue', 'peachpuff', 'white' }
}

-- lualine
Theme.lualine_config = {
    options = {
        icons_enabled = true,
        theme = 'wombat',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = { 'NvimTree', 'vista' },
            winbar = { 'NvimTree', 'vista' },
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
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
function Theme.lualine_setup()
    utils.async_run(function()
        require('lualine').setup(Theme.lualine_config)
    end)
end

-- symbols outline
-- vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
-- vim.g["vista#renderer#enable_icon"] = 1
-- vim.g["vista#renderer#icons"]["function"] = "\\uf794"
-- vim.g["vista#renderer#icons"]["variable"] = "\\uf71b"

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
function Theme.nvim_tree_setup()
    require("nvim-tree").setup({
        view = {
            width = 23,
        }
    })
end

-- bufferline
local bufclose = function(bufnum) require('bufdelete').bufdelete(bufnum, true) end
Theme.bufferline_config = {
    options = {
        diagnostics = { "nvim_lsp", "coc" },
        offsets = { {
            filetype = "NvimTree",
            text = function() return vim.fn.getcwd() end,
            highlight = "Directory",
            text_align = "left"
        } },
        close_command = bufclose,
        right_mouse_command = bufclose,
        left_mouse_command = "buffer %d",
        middle_mouse_command = bufclose,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        indicator = {
            style = "none"
        },
        separator_style = "slant",
        modified_icon = '㋡',
    }
}
function Theme.bufferline_setup()
    utils.async_run(function()
        require("bufferline").setup(Theme.bufferline_config)
    end)
end

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

-- dashboard
function Theme.dashboard_setup()
    require('dashboard').setup(dashboard_config)
end

return Theme
