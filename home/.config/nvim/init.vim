if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
        \ --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'Rigellute/rigel'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'

Plug 'vim-jp/vimdoc-ja'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/vim-sl'
Plug 'simeji/winresizer'
Plug 'luochen1990/rainbow'
Plug 'mechatroner/rainbow_csv'
Plug 'tyru/caw.vim'
Plug 'alvan/vim-closetag'

call plug#end()

scriptencoding=utf-8

syntax enable

colorscheme rigel

set encoding=utf-8
set fileencoding=utf-8
set helplang=ja
set clipboard+=unnamed
set backspace=2
set tabstop=2
set shiftwidth=2
set laststatus=2
set nobackup
set nowritebackup
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
set updatetime=300
" set signcolumn=yes

let mapleader="\<Space>"
let g:lsp_log_verbose=1
let g:lsp_log_file=expand('~/.vim-lsp/vim-lsp.log')
let g:netrw_liststyle=3
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1
let g:fern#default_hidden=1

nnoremap <silent><Esc><Esc> :nohlsearch<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>l :Line<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>c :Commands<CR>
nnoremap <Leader>b :BLines<CR>
nnoremap ,d :<C-u>Fern . -reveal=%<CR>

function s:init_fern() abort
  nnoremap <buffer>v <Plug>(fern-action-open:right)
  nnoremap <buffer>i <Plug>(fern-action-open:below)
  nnoremap <buffer>t <Plug>(fern-action-open:tabedit)
  nnoremap <buffer>o <Plug>(fern-action-open-or-expand)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

autocmd FileType help setlocal number relativenumber

autocmd FileType json syntax match Comment +\/\/.\+$+

