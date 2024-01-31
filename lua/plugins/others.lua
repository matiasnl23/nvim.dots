return {
    {
        "aserowy/tmux.nvim",
        config = function()
            return require("tmux").setup()
        end
    },
    {
        "kazhala/close-buffers.nvim",
        opts = {
            preserve_window_layout = { "all" }
        }
    },
    {
        "echasnovski/mini.indentscope",
        version = "*",
        config = function()
            require("mini.indentscope").setup({
                draw = {
                    delay = 50,
                }
            })
        end
    },
    {
        "echasnovski/mini.pairs",
        version = "*",
        config = function()
            require("mini.pairs").setup()
        end
    },
    "tpope/vim-surround",
    {
        "NMAC427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup()
        end
    },
    {
        "folke/twilight.nvim",
        opts = {}
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    },
    {
        "folke/zen-mode.nvim",
        opts = {}
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "x", "o" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = "c", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        }
    }
}
