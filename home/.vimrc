set nocompatible
set number relativenumber
set visualbell
set fileencodings=utf-8
set splitbelow splitright
set smarttab
set cursorline
set cursorcolumn
set nobackup
set wrap
set incsearch
set hlsearch
set ignorecase
set showcmd
set showmode
set showmatch
set wildmenu

filetype on
syntax on

let mapleader="\<space>"
let g:netrw_liststyle=3
let g:netrw_winsize=20

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap ,d :Explore<CR>
