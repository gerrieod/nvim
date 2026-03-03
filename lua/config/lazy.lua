-- path where lazy.nvim will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- check if lazy.nvim is already installed
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                lazypath,
        })
end

-- add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)
-- load plugin specs from lua/plugins/*
require("lazy").setup({
        spec = {
                { import = "plugins" },
        },
})
