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
                style = "deep"
            })
        end
    }
}
