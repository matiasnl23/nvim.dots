call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Themes
Plug 'rakr/vim-one'
Plug 'pineapplegiant/spaceduck'
"Plug 'sickill/vim-monokai'
Plug 'tanvirtin/monokai.nvim'

Plug 'sheerun/vim-polyglot' " syntax
"Plug 'posva/vim-vue' " syntax for vue
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'moll/vim-bbye'
Plug 'dkprice/vim-easygrep'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/agit.vim'
Plug 'lambdalisue/suda.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'
call plug#end()
