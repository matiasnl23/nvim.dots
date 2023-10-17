local map = require("helpers.keys").map

map("n", "Q", "<cmd>q<cr>", "Quit")
map("n", "!Q", "<cmd>!q<cr>", "Force quit")
map("n", "WQ", "<cmd>wq<cr>", "Write and quit")

-- Buffers
local buffers = require("helpers.buffers")
map("n", "<leader>bd", buffers.delete_this, "Delete current buffer")
map("n", "<leader>bo", buffers.delete_others, "Delete other buffers")
map("n", "<leader>ba", buffers.delete_all, "Delete all buffers")

map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Indent staying select
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Toggle dark mode
map("n", "<leader>ut", function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end, "Toggle between light and dark themes")

-- Clear search
map("n", "<space><space>", "<cmd>nohl<cr>", "Clear highlights")
