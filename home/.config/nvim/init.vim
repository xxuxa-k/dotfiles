if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
        \ --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'Rigellute/rigel'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"  Plug 'junegunn/fzf', { 'do': './install --bin' }
"  Plug 'junegunn/fzf.vim'

Plug 'simeji/winresizer'

Plug 'vim-jp/vimdoc-ja'
Plug 'LeafCage/vimhelpgenerator'
Plug 'editorconfig/editorconfig-vim'

Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddu.vim'

" Install your UIs

Plug 'Shougo/ddu-ui-ff'

" Install your sources

Plug 'Shougo/ddu-source-file_rec'
Plug 'Shougo/ddu-source-rg'

" Install your filters

Plug 'Shougo/ddu-filter-matcher_substring'

" Install your kinds

Plug 'Shougo/ddu-kind-file'


call plug#end()

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
let g:vimhelpgenerator_version=''
let g:vimhelpgenerator_author='Author: '
let g:vimhelpgenerator_contents={
      \ 'usage': 1,
      \ 'variables': 1,
      \ 'functions': 1,
      \ }
let g:lsp_log_verbose=1
let g:lsp_log_file=expand('~/vim-lsp.log')

call ddu#custom#patch_global({
      \   'ui': 'ff',
      \   'sources': [
      \     {
      \       'name': 'file_rec',
      \       'params': {
      \         'ignoredDirectories': ['.git', 'node_modules', 'vendor', '.next']
      \       }
      \     }
      \   ],
      \   'sourceOptions': {
      \     '_': {
      \       'matchers': ['matcher_substring'],
      \     },
      \   },
      \   'filterParams': {
      \     'matcher_substring': {
      \       'highlightMatched': 'Title',
      \     },
      \   },
      \   'kindOptions': {
      \     'file': {
      \       'defaultAction': 'open',
      \     },
      \   },
      \   'uiParams': {
      \     'ff': {
      \       'startFilter': v:true,
      \       'prompt': '> ',
      \       'split': 'floating',
      \     }
      \   },
      \ })

call ddu#custom#patch_local('grep', {
      \   'sourceParams' : {
      \     'rg' : {
      \       'args': ['--column', '--no-heading', '--color', 'never'],
      \     },
      \   },
      \   'uiParams': {
      \     'ff': {
      \       'startFilter': v:false,
      \     }
      \   },
      \ })


autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>

  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>

  nnoremap <buffer><silent> a
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>

  nnoremap <buffer><silent> p
        \ <Cmd>call ddu#ui#ff#do_action('preview')<CR>

  nnoremap <buffer><silent> <Esc>
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
        \ <Esc><Cmd>close<CR>

  inoremap <buffer><silent> <Esc>
        \ <Esc><Cmd>close<CR>

  nnoremap <buffer><silent> <CR>
        \ <Cmd>close<CR>

  nnoremap <buffer><silent> <Esc>
        \ <Cmd>close<CR>
endfunction

nmap <silent> ;f <Cmd>call ddu#start({})<CR>
nmap <silent> ;g <Cmd>call ddu#start({
      \   'name': 'grep',
      \   'sources':[
      \     {'name': 'rg', 'params': {'input': expand('<cword>')}}
      \   ],
      \ })<CR>
