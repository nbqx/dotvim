"for pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

"color
color colorer

syntax on
set number

"カーソル行の強調表示
"set cursorline

"ノーマルモードでenterがきくように
noremap <CR> o<ESC>

"Ctrl-kでescのかわり
map! <C-k> <esc>

"UTF-8の文字幅対応
set ambiwidth=double

"backup+swap
set nobackup
set noswapfile

"移動系
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

"backspaceでなんでも消す
set backspace=indent,eol,start

"整形オプションのマルチバイト対応
set formatoptions+=m

"折り返さないで表示
set nowrap

"入力中のコマンドを表示
set showcmd

"選択した文字をクリップボードにいれる => vimだとエラるよ
"set clipboard=unnamed
"set guioptions+=a

"みえないものを見せるよ
"nmap <leader>l :set list!<CR>
set list
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,eol:↩ 

"対応するパーレンを色づけしない
"するときはset showmatch
let loaded_matchparent=1

"検索が最後までいったらはじめにもどる
set wrapscan

"検索ハイライト+ESC連打でハイライトを消す
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"インクリメンタルサーチを有効に
set incsearch

"外部エディタで編集中のファイルが変更されたら自動で読み直す
set autoread

"tab
"set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"smart indent
set autoindent
set smartindent
set showmatch

" window操作関連
" ウィンドウのサイズをひろげる
noremap + <C-W>+
" ウィンドウのサイズをせばめる
noremap - <C-W>-
" 縦分割したら下を新しいウィンドウに
set splitbelow
" 横分割したら右を新しいウィンドウに
set splitright

" 今開いているファイルのある場所に常にcd
au BufEnter * exec ":lcd " . expand("%:p:h")

"コメント行の継続を無効にする
autocmd FileType * setlocal formatoptions-=ro

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]



