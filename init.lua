local home_dir = vim.fn.environ()["HOME"] .. "/"

-- if vim.fn.executable("volta") then
--   local node_bin = home_dir .. ".volta/tools/image/node/20.11.1/bin"
--   vim.g.node_host_prog = home_dir .. ".volta/tools/image/packages/neovim/bin/neovim-node-host"
--   vim.cmd("let $PATH = '" .. node_bin .. ":' . $PATH")
-- end

require("core.lazy")

require("core.keymaps")

require("core.options")
