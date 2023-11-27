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
            map("n", "<leader>gco", require("telescope.builtin").git_branches, "List branches")
            map("n", "<leader>gcc", require("telescope.builtin").git_commits, "List commits")
            map("n", "<leader>gcb", require("telescope.builtin").git_bcommits, "List buffer commits")
            -- map({ "n", "v" }, "<leader>gcl", require("telescope.builtin").git_bcommits_range, "List selected lines commits")
            map("n", "<leader>gss", require("telescope.builtin").git_status, "Git status")
            map("n", "<leader>gst", require("telescope.builtin").git_stash, "Git stash list")
            map("n", "<C-p>", require("telescope.builtin").find_files, "Files")
            map("n", "<leader>sf", require("telescope.builtin").find_files, "Files")
            map("n", "<leader>sr", require("telescope.builtin").oldfiles, "Recently opened")
            map("n", "<leader>sb", require("telescope.builtin").buffers, "Search buffers")
            map("n", "<leader>sw", require("telescope.builtin").grep_string, "Search word")
            map("n", "<leader>sg", require("telescope.builtin").live_grep, "Grep")
            map("n", "<leader>sc", require("telescope.builtin").colorscheme, "Colorscheme")
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
