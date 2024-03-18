return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    config = function()
      local gs = require("gitsigns")

      gs.setup({
        current_line_blame = true,
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

          map('n', '<leader>hs', gs.stage_hunk, "Stage hunk")
          map('n', '<leader>hr', gs.reset_hunk, "Reset hunk")
          map('n', '<leader>hu', gs.undo_stage_hunk, "Undo stage hunk")
          map('n', '<leader>hp', gs.preview_hunk, "Preview hunk changes")
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function ()
            gs.diffthis('~')
          end)

          map("n", "<leader>gD", gs.toggle_deleted, "Toggle Deleted")
          map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle Line Blame")
          map("n", "<leader>gS", gs.toggle_signs, "Toggle Gitsigns")
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
