local opts = {
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
    wrap = false,
    termguicolors = true,
    number = true,
    relativenumber = true,
    timeoutlen = 300
}

for opt, val in pairs(opts) do
    vim.o[opt] = val
end

local colorscheme = require("helpers.colorscheme").colorscheme
vim.cmd.colorscheme(colorscheme)
