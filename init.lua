require('options')

-- github domain, or change it to a mirror domain
local git_src_url = "github.com"

local lazy_config = {
    defaults = {
        lazy = true,
    },
    git = {
        url_format = "https://" .. git_src_url .. "/%s.git",
    },
    install = {
        missing = true,
    }
}

local function lazy_setup()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://" .. git_src_url .. "/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    require('lazy').setup("plugins", lazy_config)
end

lazy_setup()

-- keyset
require('keyset')

-- theme
require('theme')


