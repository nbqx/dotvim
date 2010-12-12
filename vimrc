"for pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

"color
color blackboard

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

"カッコの入力したら中に移動
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

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

" groovy.vim
au BufNewFile,BufRead *.groovy setf groovy
if did_filetype()
  finish
endif
if getline(1) =~ '^#!.*[/\\]groovy\>'
  setf groovy
endif

" actionscript.vim
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.mxml set filetype=mxml

" scala.vim
au BufNewFile,BufRead *.scala setf scala
if did_filetype()
  finish
endif
if getline(1) =~ '^#!.*[/\\]scala\>'
  setf scala
endif

" NERD_commenter(oldskool!!)
map <Leader># ,c<space>
let NERDShutUp=1

" nerdtree
nnoremap <f12> :NERDTreeToggle<CR>

" quickrun
if !exists('g:quickrun_config')
	let g:quickrun_config = {}
	let g:quickrun_config['*'] = {}
endif
let g:quickrun_config['*'].split = ''

" neocomplcache
hi Pmenu cterm=NONE ctermfg=Black ctermbg=White
hi PmenuSel cterm=bold ctermfg=White ctermbg=DarkBlue
hi PmenuSbar term=NONE cterm=NONE
hi PmenuThumb term=reverse cterm=reverse

let g:NeoComplCache_DisableAutoComplete = 1
let g:NeoComplCache_PreviousKeywordCompletion = 1

"omni
inoremap <expr><C-h> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"
"neocomplcache
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
"<C-p> => keyword補完
inoremap <expr><C-z> pubvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

" unite.vim
let g:unite_update_time = 1000
nnoremap <Leader>F :<C-u>Unite buffer file_mru file<Return>
nnoremap <Leader>f :<C-u>Unite file<Return>
call unite#set_substitute_pattern('files', '[[:alnum:]]', '*\0')

" autoload/jeetlib.vim
call jeetlib#_UI_StatusLine_DefineSpecialHighlights()
if has("autocmd")
    au ColorScheme * call jeetlib#_UI_StatusLine_DefineSpecialHighlights()
endif
set statusline=%!jeetlib#_UI_StatusLine_Compose()

