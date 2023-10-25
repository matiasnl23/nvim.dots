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
            preserve_window_layout = { "this", "nameless" }
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
    }
}
