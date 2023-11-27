local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local map = require("helpers.keys").map
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

local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

require("helpers.keys").set_leader("\\")

lazy.setup("plugins")

map("n", "<leader>L", lazy.show, "Show Lazy")
map("n", "<C-s>", ":update<CR>")
map({"i", "v"}, "<C-s>", "<Esc>:update<CR>")
