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
        -- stylua: ignore
        keys = {
            { "s", mode = 'v', false },
            { "S", mode = 'v', false },
            -- { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            -- { "S",     mode  = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            -- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
}
