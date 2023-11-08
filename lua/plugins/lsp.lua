return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
      },
      "folke/neodev.nvim",
      "RRethy/vim-illuminate",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
      })

      require("neodev").setup()

      require("fidget").setup()

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local config = {
        virtual_text = false,
        signs = {
          active = signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      vim.diagnostic.config(config)

      -- Function runs when LSP is attached to a buffer
      local on_attach = function(client, bufnr)
        local lsp_map = require("helpers.keys").lsp_map

        lsp_map("<leader>rn", vim.lsp.buf.rename, bufnr, "Rename symbol")
        lsp_map("<Space>ca", vim.lsp.buf.code_action, bufnr, "Code action")
        lsp_map("<Space>cs", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

        lsp_map("gd", require("telescope.builtin").lsp_definitions, bufnr, "Goto definition")
        lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto references")
        lsp_map("gt", require("telescope.builtin").lsp_type_definitions, bufnr, "Type definition")
        lsp_map("<leader>K", vim.lsp.buf.hover, bufnr, "Hover documentation")

        lsp_map("<Space>e", vim.diagnostic.open_float, bufnr, "Show error")
        lsp_map("[d", vim.diagnostic.goto_prev, bufnr, "Previous diagnostic")
        lsp_map("]d", vim.diagnostic.goto_next, bufnr, "Next diagnostic")

        -- Format function
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
          vim.lsp.buf.format({ async = false })
        end, { desc = "Format current buffer with LSP" })

        lsp_map("<Space>cf", "<cmd>Format<cr>", bufnr, "Format file")

        -- Vim illuminate
        require("illuminate").on_attach(client)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          -- Lua
          require("lspconfig")["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace",
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                  },
                },
              },
            },
          })
        end,
        ["jsonls"] = function()
          -- JSON
          require("lspconfig")["jsonls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true }
              }
            }
          })
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup()
    end,
  },
  { "b0o/schemastore.nvim" },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons"
    },
    opts = {}
  }
}
