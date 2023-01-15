-- require('zephyr')
require('github-theme').setup({
    theme_style = "dark",
    sidebars = {"terminal", "packer"},
    -- dark_sidebar = false,
    dark_float = true
})

-- rainbow parenthese
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
    -- gui color
    guifgs = { 'darkgray', 'lightslategray', 'lightskyblue', 'Cornflowerblue', 'peachpuff', 'white' }
}

-- lightline
vim.g.lightline = {
    colorscheme = "wombat",
    enable = {
        -- it is conflicted with bufferline
        -- disable tabline for bufferline
        tabline = 0
    },
    active = {
        left = { { 'mode', 'paste' },
        { 'readonly', 'filename', 'modified', 'method' } }
    },
    component_function = {
        method = 'NearestMethodOrFunction'
    },
}

-- symbols outline
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g["vista#renderer#enable_icon"] = 1
vim.g["vista#renderer#icons"]["function"] = "\\uf794"
vim.g["vista#renderer#icons"]["variable"] = "\\uf71b"
