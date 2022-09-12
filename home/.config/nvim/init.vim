if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim
    \ --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'scrooloose/syntastic'
Plug 'cocopon/iceberg.vim'
Plug 'Rigellute/rigel'
Plug 'tomasr/molokai'
Plug 'pgavlin/pulumi.vim'
Plug 'ghifarit53/tokyonight-vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-emmet.vim'
Plug 'lighttiger2505/sqls.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chemzqm/denite-git'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'vim-jp/vimdoc-ja'
Plug 'LeafCage/vimhelpgenerator'
Plug 'editorconfig/editorconfig-vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'mattn/vim-sl'
Plug 'tpope/vim-surround'
Plug 'simeji/winresizer'
Plug 'luochen1990/rainbow'
Plug 'mechatroner/rainbow_csv'
Plug 'tyru/caw.vim'
Plug 'junegunn/vim-peekaboo'

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
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:rigel_airline=1
" let g:airline_theme='rigel'
let g:airline_theme='tokyonight'
let g:rainbow_active=1
let g:terraform_fmt_on_save=1
let g:netrw_liststyle=3
let g:fzf_layout={
      \ 'down': '~40%'
      \ }
let g:deol#shell_history_path='~/.zsh_history'
let g:gitgutter_highlight_lines=0
let g:javascript_plugin_flow=1
let g:closetag_filenames='*.html,*.vue,*.php'
let g:closetag_filetypes='html,vue,php'
let g:closetag_xhtml_filenames='*.xhtml,*.jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive=1
let g:closetag_shortcut='>'
let g:closetag_close_shortcut='<leader>>'
let g:hugohelper_spell_check_lang='en_us'
let g:vimhelpgenerator_version=''
let g:vimhelpgenerator_author='Author: '
let g:vimhelpgenerator_contents={
      \ 'usage': 1,
      \ 'variables': 1,
      \ 'functions': 1,
      \ }
let g:lsp_log_verbose=1
let g:lsp_log_file=expand('~/vim-lsp.log')
let g:fern#logfile=expand('~/fern.tsv')
let g:fern#comparator='lexical'
let g:iced_enable_default_key_mappings=v:true
let g:iced#buffer#stdout#mods='vertical'
let g:iced#buffer#error#height=5
" let g:tokyonight_style='storm'
let g:tokyonight_style='night'
let g:tokyonight_enable_italic=1
let g:denite_source_ridgepole#schemafile_path='db/schema/Schemafile'

if executable('rg')
  let &grepprg='rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m
endif

" =======================================================
" Functions
" =======================================================

function! FzfBLinesCurrWord()
  let currWord = expand('<cword>')
  if len(currWord) > 0
    call fzf#vim#blines({'options': '-q ' . currWord})
  else
    execute ':BLines'
  endif
endfunction

function! OpenNewDefx() abort
  let l:rand = Rand()
  execute ':Defx -buffer-name='.l:rand
endfunction

function! Rand() abort
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

" =======================================================
" Key Mappings
" =======================================================

cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>
nnoremap <C-t>" :split<CR>
nnoremap <C-t>% :vsplit<CR>
nnoremap <C-l>d :LspDefinition<CR>
nnoremap <C-l>s :LspStatus<CR>
nnoremap <C-l>h :LspHover<CR>
nnoremap <C-l>c :LspCodeAcion<CR>
nnoremap <C-g>s :Gstatus<CR>
nnoremap <C-g>d :Gdiff<CR>
nnoremap <silent><Esc><Esc> :nohlsearch<CR>
nnoremap <Leader>sl :call sl#animate()<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
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
" https://wonderwall.hatenablog.com/entry/2017/10/07/220000
nnoremap <silent>,r :Denite ridgepole<CR>
nnoremap <silent>,f :Files<CR>
nnoremap <silent>,g :GFiles<CR>
nnoremap <silent>,x :GFiles?<CR>
nnoremap <silent>,b :Buffers<CR>
nnoremap <silent>,l :BLines<CR>
nnoremap <silent>,h :History<CR>
nnoremap <silent>,m :Mark<CR>
nnoremap <silent>,ag :Ag<CR>
nnoremap <silent>,d :call OpenNewDefx()<CR>
nnoremap <silent>,n :NERDTreeToggle<CR>
" https://medium.com/@bookun/vim-advent-calendar-2019-12-20-63a12396211f
nnoremap <silent>df :Deol -split=floating<CR>
nnoremap <silent>dv :Deol -split=vertical<CR>
nnoremap <silent>dx :Deol -split=horizontal<CR>
nnoremap <silent>bg (deol_bg)

" =======================================================
" Dark powerd Settings
" =======================================================

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
let s:menus.rails = {
      \ 'description': 'Commands in Rails project',
      \ 'command_candidates': [
        \ ['install gems', '!bundle install'],
        \ ['execute tests', '!bundle exec rails test'],
        \ ['rubocop', '!bundle exec rubocop'],
        \ ['rubocop auto-correct', '!bundle exec rubocop --auto-correct'],
        \ ['slim-lint', '!bundle exec slim-lint app/**/*.slim'],
      \ ]
      \ }
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

call defx#custom#column('mark', {
    \ 'readonly_icon': '✗',
    \ 'selected_icon': '✓',
    \ })
call defx#custom#option('_', {
      \ 'show_ignored_files': v:true,
      \ })

" call deoppet#initialize()
" call deoppet#custom#option('snippets_dirs', globpath(&runtimepath, 'neosnippets', 1, 1))

" imap <C-k>  <Plug>(deoppet_expand)
" imap <C-f>  <Plug>(deoppet_jump_forward)
" imap <C-b>  <Plug>(deoppet_jump_backward)
" smap <C-f>  <Plug>(deoppet_jump_forward)
" smap <C-b>  <Plug>(deoppet_jump_backward)

" =======================================================
" Auto Commands
" =======================================================

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

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Defx | endif

autocmd FocusGained,BufEnter * checktime

autocmd BufRead,BufNewFile *.slim set filetype=slim
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
autocmd BufRead,BufNewFile *.jsx set filetype=jsx
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

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr><CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> v defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> i defx#do_action('open', 'split')
  nnoremap <silent><buffer><expr> t defx#do_action('open', 'tabnew')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> x defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> ee defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> b defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emmet#get_source_options({
    \ 'name': 'emmet',
    \ 'whitelist': ['html'],
    \ 'completor': function('asyncomplete#sources#emmet#completor'),
    \ }))

