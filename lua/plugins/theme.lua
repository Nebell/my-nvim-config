--------------------  github theme -------------------
local function theme_setup()
    local _ = require("onenord.colors").load()
    require('onenord').setup({
        theme = "dark",  -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        borders = true,  -- Split window borders
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
            eob_lines = true,   -- Hide the end-of-buffer lines
        },
        -- Inverse highlight for different groups
        inverse = {
            match_paren = false,
        },
        custom_highlights = {
                              -- Overwrite default highlight groups
            ["@string"] = { fg = "#B0BEC5" },
            ["@character"] = { fg = "#90A4AE" },
        },
        custom_colors = {}, -- Overwrite default colors
    })
end

-------------- rainbow parenthese ----------------
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
    -- gui color
    guifgs = { 'darkgray', 'lightslategray', 'lightskyblue', 'Cornflowerblue', 'peachpuff', 'white' }
}

return {
    ---------- theme -------------
    {
        'rmehri01/onenord.nvim',
        event = "UIEnter",
        config = theme_setup
    },

    ---------- rainbow parenthese -------------
    { 'luochen1990/rainbow', event = "BufReadPost" },
}
