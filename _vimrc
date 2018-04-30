set encoding=utf-8
scriptencoding utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('scrooloose/nerdtree')
call dein#add('szw/vim-tags')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-surround')
call dein#add('airblade/vim-gitgutter')
call dein#add('mattn/emmet-vim')
call dein#add('mattn/webapi-vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('othree/html5.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('kchmck/vim-coffee-script')
call dein#add('gmarik/Vundle.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('slim-template/vim-slim')

call dein#end()

" :
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
" vim-tags
nnoremap <C-]> g<C-]>

" バックスペースキーの動作を決定する
" 2:indent,eol,startと同じ
" set backspace=2

" 行番号を表示する
set number

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" 検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

" (no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set nowrapscan

" インクリメンタルサーチを行う
set incsearch

" highlight matches with last search pattern
set hlsearch

" (no)ウィンドウの幅を超える行の折り返し設定
set nowrap

" タブ文字、行末など不可視文字を表示する
set list

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" 新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 保存しないで他のファイルを表示することが出来るようにする
set hidden

" Insertモードで<Tab> を挿入するのに、適切な数の空白を使う
set expandtab

" ファイル内の <Tab> が対応する空白の数
set tabstop=2

" 自動インデントの各段階に使われる空白の数
set shiftwidth=2

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" (no)ファイルを上書きする前にバックアップファイルを作る
set nobackup

" □や○文字が崩れる問題を解決
set ambiwidth=double

" 強調表示(色付け)のON/OFF設定
syntax on

" listで表示される文字のフォーマットを指定する
" ※デフォルト eol=$ を打ち消す意味で設定
set listchars=tab:>-

" カーソルの上または下に表示する最小限の行数
set scrolloff=5

" ステータスラインを表示するウィンドウを設定する
" 2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" ウィンドウ移動
nnoremap <silent> wh <C-W>h
nnoremap <silent> wj <C-W>j
nnoremap <silent> wk <C-W>k
nnoremap <silent> wl <C-W>l

" タブ操作
nnoremap <silent> tn :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> td :<C-u>bdelete<CR>
nnoremap <silent> tD :<C-u>tabc<CR>
nnoremap <silent> td :<C-u>quit<CR>"

" タブ移動
nnoremap <silent> L :<C-u>tabnext<CR>
nnoremap <silent> H :<C-u>tabprevious<CR>

" vimを開く、vimを更新
nnoremap <silent> g<Space> :<C-u>edit $HOME/.vimrc<CR>
nnoremap <silent> ,<Space> :<C-u>source $HOME/.vimrc<CR>"

nnoremap <silent>cl :<C-u>NERDTreeClose<CR>
" nnoremap <silent>mk :<C-u>NERDTree<CR>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ( ()<LEFT>

" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" 行頭のTAB文字を可視化
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace",'　')

nnoremap <silent> <Space>f :<C-u>Unite file_mru -start-insert<CR>

" swapファイルを生成しない
set noswapfile

" end 自動入力
execute pathogen#infect()

" neocomplcache
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : ''
      \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

set list
set listchars=trail:-,extends:»,precedes:«,nbsp:%

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>

" 括弧ハイライト調整
hi MatchParen ctermbg=1

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

" XML/HTML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

" https://gist.github.com/qickstarter/3668558
"----------------------------------------
" zencoding
"----------------------------------------
" codaのデフォルトと一緒にする
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'
" 言語別に対応させる
let g:user_zen_settings = {
\ 'lang' : 'ja',
\ 'html' : {
\ 'filters' : 'html',
\ 'indentation' : ' '
\ },
\ 'css' : {
\ 'filters' : 'fc',
\ },
\}

" HTML 5 tags
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
 Plugin 'othree/html5.vim'

" syntax highlighting for Vue components.
Plugin 'posva/vim-vue'

Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\ 'lang' : 'ja',
\ 'html' : {
\ 'filters' : 'html',
\ },
\ 'css' : {
\ 'filters' : 'fc',
\ },
\ 'php' : {
\ 'extends' : 'html',
\ 'filters' : 'html',
\ },
\}
augroup EmmitVim
autocmd!
autocmd FileType * let g:user_emmet_settings.indentation = ' '[:&tabstop]
augroup END

" 編集中の行に下線を引く
au InsertLeave * setlocal nocursorline
au InsertEnter * setlocal cursorline
au InsertLeave * highlight StatusLine ctermfg=145 guifg=#c2bfa5 guibg=#000000
au InsertEnter * highlight StatusLine ctermfg=12 guifg=#1E90FF

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" enabled scrollback
" set mouse=a

" no highlight
nnoremap <ESC><ESC> :noh<CR>

let g:jsx_ext_required = 0

nnoremap <silent><C-e> :NERDTreeToggle<CR>

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz

" カレント列をハイライト
autocmd InsertEnter,InsertLeave * set cursorcolumn!

" Mojo epl templates
let mojo_highlight_data = 1
let mojo_disable_html = 1

Plugin 'wakatime/vim-wakatime'


nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

autocmd InsertLeave * set nopaste

" 隠しファイルを表示する
" let NERDTreeShowHidden = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set clipboard=unnamed,autoselect
