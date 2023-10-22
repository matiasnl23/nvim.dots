return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                filesystem = {
                    follow_current_file = {
                        enabled = true
                    }
                },
                buffers = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = false,
                    }
                }
            })
            require("helpers.keys").map(
            { "n", "v" },
            "<leader>e",
            "<cmd>Neotree toggle<cr>",
            "Toggle file explorer"
            )
        end,
    }
}
