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

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chemzqm/denite-git'
Plug 'Shougo/neomru.vim'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'

Plug 'vim-jp/vimdoc-ja'
Plug 'LeafCage/vimhelpgenerator'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/vim-sl'
Plug 'tpope/vim-surround'
Plug 'simeji/winresizer'
Plug 'luochen1990/rainbow'
Plug 'mechatroner/rainbow_csv'
Plug 'tyru/caw.vim'
Plug 'junegunn/vim-peekaboo'
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
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:rigel_airline=1
let g:airline_theme='rigel'
let g:rainbow_active=1
let g:fzf_layout={
      \ 'down': '~40%'
      \ }
let g:closetag_filetypes='html,jsx,tsx'
let g:closetag_xhtml_filetypes = 'xhtml'
let g:closetag_filenames='*.html,*.jsx,*.tsx'
let g:closetag_xhtml_filenames='*.xhtml'
let g:closetag_shortcut='>'
let g:closetag_close_shortcut=''
let g:closetag_emptyTags_caseSensitive=0
let g:vimhelpgenerator_version=''
let g:vimhelpgenerator_author='Author: '
let g:vimhelpgenerator_contents={
      \ 'usage': 1,
      \ 'variables': 1,
      \ 'functions': 1,
      \ }
let g:fern#default_hidden=1
let g:fern#logfile=expand('~/fern.tsv')

if executable('rg')
  let &grepprg='rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m
endif

cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>
nnoremap <C-t>" :split<CR>
nnoremap <C-t>% :vsplit<CR>
nnoremap <C-g>s :Gstatus<CR>
nnoremap <C-g>d :Gdiff<CR>
nnoremap <silent><Esc><Esc> :nohlsearch<CR>
nnoremap <Leader>sl :call sl#animate()<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap ,d :<C-u>Fern . -reveal=%<CR>
nnoremap <Leader>f :Denite file/rec file_mru buffer<CR>
nnoremap <Leader>l :Denite line<CR>
nnoremap <Leader>e :Denite file/rec buffer<CR>
nnoremap <Leader>h :Denite defx/history<CR>
nnoremap <Leader>g :Denite grep<CR>
nnoremap <Leader>b :Denite buffer<CR>
nnoremap <Leader>m :Denite menu<CR>
nnoremap <Leader>o :Denite outline<CR>
nnoremap <Leader>u :Denite source<CR>
nnoremap <Leader>c :Denite gitstatus<CR>
nnoremap <Leader>r :Denite register<CR>
nnoremap <silent>,r :Denite ridgepole<CR>
nnoremap <silent>,f :Files<CR>
nnoremap <silent>,g :GFiles<CR>
nnoremap <silent>,x :GFiles?<CR>
nnoremap <silent>,b :Buffers<CR>
nnoremap <silent>,l :BLines<CR>
nnoremap <silent>,h :History<CR>
nnoremap <silent>,m :Mark<CR>
nnoremap <silent>,ag :Ag<CR>

call denite#custom#source('file_mru', 'matchers', ['matcher/fuzzy'])
call denite#custom#source('file/rec', 'sorters', ['sorter/sublime'])
call denite#custom#kind('file', 'default_action', 'open')
call denite#custom#var('file/rec', 'command', ['ag', '--hidden', '--ignore-dir', '.git', '--follow', '--nocolor', '-g', ''])
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
call denite#custom#var('file/rec/py', 'command', ['scantree.py', '--path', ':directory'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/', 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
call denite#custom#action('file', 'test', {
      \ context -> execute('let g:foo = 1')
      \ })
call denite#custom#action('file', 'test2', {
      \ context -> denite#do_action(
      \  CONTEXT, 'OPEN', CONTEXT['TARGETS']
      \ )})
call denite#custom#option('_', 'statusline', v:false)
call denite#custom#option('default', {
      \ 'split': 'horizontal',
      \ 'highlight_filter_background': 'DeniteFilter',
      \ 'prompt': '> ',
      \ 'start_filter': v:true
      \})
let s:menus = {}
let s:menus.dotfiles = {
      \ 'description': 'Edit dotfiles',
      \ 'file_candidates': [
        \ ['neovim', '~/.config/nvim/init.vim'],
        \ ['vim', '~/.vimrc'],
        \ ['tmux', '~/.tmux.conf'],
        \ ['zshrc', '~/.zsh/.zshrc'],
      \ ]
      \ }
call denite#custom#var('menu', 'menus', s:menus)

augroup AuthQuickFix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

augroup AutoCommentOff
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=ro
augroup END

augroup MakefileTab
  autocmd!
  autocmd FileType make set noexpandtab nosmarttab
augroup END

autocmd FocusGained,BufEnter * checktime

autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
autocmd BufRead,BufNewFile *.sbt set filetype=scala
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd BufRead,BufNewFile *.spacemacs set filetype=lisp

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr><CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'quickfix')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr><Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer><C-o> <Plug>(denite_filter_quit)
  imap <silent><buffer><Esc> <Plug>(denite_filter_quit)
endfunction

autocmd User denite-preview call s:denite_preview()
function! s:denite_preview() abort
  setlocal number
endfunction

autocmd FileType help setlocal number relativenumber

autocmd FileType json syntax match Comment +\/\/.\+$+

function! FzfBLinesCurrWord()
  let currWord = expand('<cword>')
  if len(currWord) > 0
    call fzf#vim#blines({'options': '-q ' . currWord})
  else
    execute ':BLines'
  endif
endfunction

function! Rand() abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

function s:init_fern() abort
  nnoremap <buffer>v <Plug>(fern-action-open:right)
  nnoremap <buffer>i <Plug>(fern-action-open:bottom)
  nnoremap <buffer>o <Plug>(fern-action-open-or-expand)
endfunction
