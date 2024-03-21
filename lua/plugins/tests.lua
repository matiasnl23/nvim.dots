return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      local map = require("helpers.keys").map
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-jest")({
            env = { CI = true },
          }),
          require("neotest-vitest")
        },
      })

      map("n", "<leader>tn", function()
        neotest.run.run()
      end, "Run nearest test")
      map("n", "<leader>ts", function()
        neotest.run.stop()
      end, "Stop test")
      map("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, "Run tests in current file")
      map("n", "<leader>tw", function()
        neotest.run.run({ jestCommand = "jest --watch " })
      end, "Run tests in watch mode")

      map("n", "<leader>tP", function()
        neotest.output_panel.toggle()
      end, "Toggle test panel")
      map("n", "<leader>tS", function()
        neotest.summary.toggle()
      end, "Toggle test summary")
      map("n", "<leader>tO", function()
        neotest.output.open({ enter = true })
      end, "Toggle open")

      map("n", "<leader>[t", function()
        neotest.jump.prev({ status = "failed" })
      end, "Go to previous failed test")
      map("n", "<leader>]t", function()
        neotest.jump.prev({ status = "failed" })
      end, "Go to next failed test")

      vim.api.nvim_create_autocmd({ "BufWrite" }, {
        pattern = { "*.spec.ts" },
        callback = function()
          neotest.run.run(vim.fn.expand("%"))
        end,
      })
    end,
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local cov = require("coverage")
      local map = require("helpers.keys").map
      cov.setup({
        signs = {
          -- covered = { hl = "CoverageCovered", text = "▎" },
          -- uncovered = { hl = "CoverageUncovered", text = "▎" },
          covered = { hl = "CoverageCovered", text = "C" },
          uncovered = { hl = "CoverageUncovered", text = "U" },
          partial = { hl = "CoveragePartial", text = "P" },
        },
      })

      map("n", "<leader>tcl", cov.load, "Load coverage")
      map("n", "<leader>tct", cov.toggle, "Toggle coverage highlights")
    end,
  },
}
