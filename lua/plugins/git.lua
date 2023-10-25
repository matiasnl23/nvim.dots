return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    config = function()
      local gs = require("gitsigns")

      gs.setup({
        on_attach = function ()
          local map = require("helpers.keys").map

          -- Navigation
          map("n", "]c", function ()
            if vim.wo.diff then return "]c" end
            vim.schedule(function () gs.next_hunk() end)
            return "<Ignore>"
          end, "Go to next change")
          map("n", "[c", function ()
            if vim.wo.diff then return "[c" end
            vim.schedule(function () gs.prev_hunk() end)
            return "<Ignore>"
          end, "Go to previous change")

          map("n", "<leader>gS", gs.toggle_signs, "Toggle gitsigns")
        end
      })
    end
  },
  {
    "tpope/vim-fugitive",
    config = function()
      local map = require("helpers.keys").map

      map("n", "<leader>ga", "<cmd>Git add %<cr>", "Stage current file")
      map("n", "<leader>gb", "<cmd>Git blame<cr>", "Show blame")
    end
  }
}
