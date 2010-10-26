" 書体の設定
set antialias
set guifont=EnvyCodeR:h13

" ウィンドウのサイズ
set columns=140
set lines=40
set linespace=2

" GUIを英語にしてしまう
"source $VIMRUTIME/delmenu.vim
set langmenu=none
source $VIMRUNTIME/menu.vim
lang en_gb

" 色設定
color blackboard

" ツールバー非表示
set guioptions-=T
" 背景を半透明に
set transparency=15

" 自動IMオン/オフ
set imdisable
" 挿入モード・検索モードでのデフォIME状態の設定
set iminsert=0 imsearch=0
" 日本語入力中のカーソルの色をかえる
highlight CursorIM guifg=NONE guibg=Red
