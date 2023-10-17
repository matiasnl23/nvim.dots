return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = vim.fn.executable("make") == 1
            }
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false
                        }
                    }
                }
            })

            pcall(require("telescope").load_extension, "fzf")

            local map = require("helpers.keys").map
            map("n", "<C-p>", require("telescope.builtin").find_files, "Files")
            map("n", "<leader>sf", require("telescope.builtin").find_files, "Files")
            map("n", "<leader>sr", require("telescope.builtin").oldfiles, "Recently opened")
            map("n", "<leader>sb", require("telescope.builtin").buffers, "Search buffers")
            map("n", "<leader>sw", require("telescope.builtin").grep_string, "Search word")
            map("n", "<leader>sg", require("telescope.builtin").live_grep, "Grep")
            map("n", "<leader>ss", function()
                require("telescope.builtin").current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false
                    })
                )
            end , "Search in current buffer")
        end
    }
}
