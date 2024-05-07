----------------------- bufferline -------------------
local bufclose = function(bufnum) require('bufdelete').bufdelete(bufnum, true) end
local config = {
    options = {
        diagnostics = { "nvim_lsp", "coc" },
        offsets = { {
            filetype = "NvimTree",
            text = function() return vim.fn.getcwd() end,
            highlight = "Directory",
            text_align = "left"
        }, {
            filetype = "Outline",
            text = "Symbol Outline",
            text_align = "center"
        }
        },
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
local function setup()
    require('utils').async_run(function()
        require("bufferline").setup(config)
    end)
end

-------------- tabline -------------------
return {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    event = "BufReadPre",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        -- delete a buffer without mess up the layout
        { 'famiu/bufdelete.nvim', module = 'bufferline' },
    },
    config = setup,
    keys = {
        { "<C-H>", "<cmd>BufferLineCyclePrev<CR>", mode = { "n", "v", "i" }, { silent = true } },
        { "<C-L>", "<cmd>BufferLineCycleNext<CR>", mode = { "n", "v", "i" }, { silent = true } },
        {
            "<Leader>cb",
            function()
                bufclose(0)
            end,
            mode = { "n", "v", "i" },
            { silent = true }
        },
    }
}
