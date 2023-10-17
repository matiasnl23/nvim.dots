return {
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.register({
                {
                    ["<leader>"] = {
                        u = { name = "UI" },
                        f = { name = "Files" },
                        b = { name = "Buffers" },
                    },
                    ["<space>"] = {
                        c = { name = "Code" },
                        f = { name = "Files" },
                    }
                }
            })
        end
    }
}

