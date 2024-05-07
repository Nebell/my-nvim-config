theme = {}

utils = require('utils')

-- github theme
function theme.github_setup()
    require('github-theme').setup({
        theme_style = "dark",
        sidebars = {"terminal", "packer"},
        -- dark_sidebar = false,
        dark_float = true
    })
end

-- rainbow parenthese
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
    -- gui color
    guifgs = { 'darkgray', 'lightslategray', 'lightskyblue', 'Cornflowerblue', 'peachpuff', 'white' }
}

-- lualine
lualine_config = {
    options = {
        icons_enabled = true,
        theme = 'wombat',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
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
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
function theme.lualine_setup()
    utils.async_run(function()
        require('lualine').setup(lualine_config)
    end)
end

-- symbols outline
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
-- vim.g["vista#renderer#enable_icon"] = 1
-- vim.g["vista#renderer#icons"]["function"] = "\\uf794"
-- vim.g["vista#renderer#icons"]["variable"] = "\\uf71b"

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
function theme.nvim_tree_setup()
    require("nvim-tree").setup({
        view = {
            width = 23,
        }
    })
end

-- bufferline
bufferline_config = {
    options = {
        diagnostics = {"nvim_lsp", "coc"},
        offsets = {{
            filetype = "NvimTree",
            text = function() return vim.fn.getcwd() end,
            highlight = "Directory",
            text_align = "left"
        }},
        close_command = bufclose, 
        right_mouse_command = bufclose, 
        left_mouse_command = "buffer %d",   
        middle_mouse_command = bufclose,
        always_show_bufferline = true, 
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        indicator = {
            style = "none"
        }
    }
}
local bufclose = function(bufnum) require('bufdelete').bufdelete(bufnum, true) end
function theme.bufferline_setup() 
    utils.async_run(function()
        require("bufferline").setup(bufferline_config)
    end)
end

return theme
