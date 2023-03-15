if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_Theme = 'spaceduck'

let g:coc_snippets_next = '<c-j>'
let g:coc_snippets_prev = '<c-k>'

let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

let g:coc_status_error_sign = ''
let g:coc_status_warning_sign = ''

"function! s:CheckBackSpace() abort
function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

function! ShowDocumentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocAction('doHover')
    else
        execute '!' . &keywordprg . ' ' . expand('<cword>')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

lua <<EOF
local dap = require('dap')
require("dapui").setup()
require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = "/home/matias/.config/nvim/debugger/vscode-js-debug", -- Path to vscode-js-debug installation. 
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "${workspaceFolder}",
    }
  }
end
dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { os.getenv('HOME') .. '.config/nvim/debugger/vscode-chrome-debug' }
}

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '.config/nvim/debugger/vscode-node-debug2/out/src/nodeDebug.js' } 
}
-- dap.configurations.javascript = {
--     {
--         name = 'Launch',
--         type = 'node2',
--         request = 'launch',
--         program = '${file}',
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = 'inspector',
--         console = 'integratedTerminal',
--     }, {
--         name = 'Attach to process',
--         type = 'node2',
--         request = 'attach',
--         processId = require'dap.utils'.pick_process,
--     },
-- }
vim.fn.sign_define('DapBreakpoint', { text='🟥', texthl='', linehl='', numhl='' })
vim.fn.sign_define('DapStopped', { text='⭐️', texthl='', linehl='', numhl='' })
EOF

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction
