require("config/settings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    defaults = {
        -- lazy = false,
    },
})

require("config/keybindings")
require("config/colors/colors")
require("config/autocommands")
require("config/completion")
require("config/lsp")
require("config/snippets")
require("config/zettels")
