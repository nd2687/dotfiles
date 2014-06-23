set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

    " ここにインストールしたいプラグインのリストを書く
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'h1mesuke/unite-outline'
 NeoBundle 'Align'
 "NeoBundle 'neocomplcache'
 NeoBundle 'The-NERD-tree'
 NeoBundle 'szw/vim-tags'
    " :
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags  
" vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
nnoremap <C-]> g<C-]>
  
"(no)VimをなるべくVi互換にする
set nocompatible

"バックスペースキーの動作を決定する
"2:indent,eol,startと同じ
set backspace=2

"行番号を表示する
set number

"新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

"検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

"(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set nowrapscan

"インクリメンタルサーチを行う
set incsearch

"highlight matches with last search pattern
set hlsearch

"(no)ウィンドウの幅を超える行の折り返し設定
set nowrap

"タブ文字、行末など不可視文字を表示する
set list

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"保存しないで他のファイルを表示することが出来るようにする
set hidden

"カレントバッファ内のファイルの文字エンコーディングを設定する
set fileencoding=utf-8

"Insertモードで<Tab> を挿入するのに、適切な数の空白を使う
set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=2

"自動インデントの各段階に使われる空白の数
set shiftwidth=2

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

"(no)ファイルを上書きする前にバックアップファイルを作る
set nobackup

"強調表示(色付け)のON/OFF設定
syntax on

"listで表示される文字のフォーマットを指定する
"※デフォルト eol=$ を打ち消す意味で設定
set listchars=tab:>-

"カーソルの上または下に表示する最小限の行数
set scrolloff=5

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
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
   
    "vimを開く、vimを更新
    nnoremap <silent> g<Space> :<C-u>edit $HOME/.vimrc<CR>
    nnoremap <silent> ,<Space> :<C-u>source $HOME/.vimrc<CR>"
   
    nnoremap <silent>cl :<C-u>NERDTreeClose<CR>
    nnoremap <silent>mk :<C-u>NERDTree<CR>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ( ()<LEFT>

filetype on
filetype indent on
filetype plugin on
" filetype plugin on
" filetype indent on

"行末の空白文字を可視化
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

"swapファイルを生成しない
set noswapfile

"end 自動入力
execute pathogen#infect()

"" neocomplcache
NeoBundle 'Shougo/neocomplcache'
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
