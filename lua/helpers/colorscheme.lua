local M = {}

local function get_if_available(name, opts)
    local lua_ok, colorscheme = pcall(require, name)
    if lua_ok then
        colorscheme.setup(opts)
        return name
    end

    local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
    if vim_ok then
        return name
    end

    return "default"
end

M.toggle_dark_mode = function()
    local current_theme = vim.g.colors_name

    if current_theme == "onedark" then
        require("onedark").toggle()
        return
    end

    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end

M.colorscheme = get_if_available("onedark")

return M
