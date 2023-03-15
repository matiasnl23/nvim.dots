set nocompatible
set rtp+=~/.fzf/bin/fzf

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/various.vim
source ~/.config/nvim/overwrite.vim

colorscheme one
"set background=dark

syntax on
filetype plugin on
set number
set relativenumber
set cursorline
set nowrap

set hidden
set noshowmode
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

set tabstop=8
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab

set mouse=a

if has("patch-8.1.1564")
    set signcolumn=number
endif

if &t_Co == 8 && $TERM !~# '^Eterm'
    set t_Co=16
endif

if &t_Co >= 256
    set termguicolors
endif

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
