if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
    \ --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'simeji/winresizer'

Plug 'cocopon/iceberg.vim'
Plug 'Rigellute/rigel'
Plug 'tomasr/molokai'
Plug 'pgavlin/pulumi.vim'
Plug 'ghifarit53/tokyonight-vim'

Plug 'vim-jp/vimdoc-ja'
Plug 'LeafCage/vimhelpgenerator'
Plug 'editorconfig/editorconfig-vim'

Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddu.vim'

" Install your UIs

Plug 'Shougo/ddu-ui-ff'

" Install your sources

" Install your filters

" Install your kinds


call plug#end()

" =======================================================
" Global Settings
" =======================================================

scriptencoding=utf-8

syntax enable

" colorscheme iceberg
colorscheme rigel
" colorscheme molokai
" colorscheme pulumi
" colorscheme tokyonight

set encoding=utf-8
set fileencoding=utf-8
set helplang=ja
set clipboard+=unnamed
set backspace=2
set tabstop=2
set shiftwidth=2
set laststatus=2
set nobackup
set noswapfile
set ruler
set termguicolors
set pumblend=25
set showmatch
set matchtime=4
set wrapscan
set hlsearch
set showcmd
set title
set number relativenumber
set cursorline
set cursorcolumn
set nofoldenable
set expandtab
set showtabline=2
set splitbelow
set splitright
set incsearch
set ignorecase
set synmaxcol=256
set smartcase
set background=dark
set updatetime=250
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set wildchar=<TAB>
set wildmenu
set wildmode=longest:full,full
set nocompatible
set inccommand=split
set noerrorbells
set novisualbell
set autoread

let mapleader="\<Space>"
let g:netrw_liststyle=3
let g:fzf_layout={
      \ 'down': '~40%'
      \ }
let g:vimhelpgenerator_version=''
let g:vimhelpgenerator_author='Author: '
let g:vimhelpgenerator_contents={
      \ 'usage': 1,
      \ 'variables': 1,
      \ 'functions': 1,
      \ }
let g:lsp_log_verbose=1
let g:lsp_log_file=expand('~/vim-lsp.log')
" let g:tokyonight_style='storm'
let g:tokyonight_style='night'
let g:tokyonight_enable_italic=1

call ddu#custom#patch_global({
    \ 'ui': 'ff',
    \ })

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

