return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    {
        "tpope/vim-fugitive",
        config = function ()
            local map = require("helpers.keys").map

            map("n", "<leader>ga", "<cmd>Git add %<cr>", "Stage current file")
            map("n", "<leader>gb", "<cmd>Git blame<cr>", "Show blame")
        end
    }
}
