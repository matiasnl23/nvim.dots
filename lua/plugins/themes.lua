return {
    "typicode/bg.nvim",
    "ellisonleao/gruvbox.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    { "rose-pine/nvim",  name = "rose-pine" },
    "sainnhe/everforest",
    "savq/melange-nvim",
    "sainnhe/sonokai",
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                style = "warmer",
                toggle_style_list = { "deep", "light" }
            })
        end
    },
}
