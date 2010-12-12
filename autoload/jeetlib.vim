" Status Line {{{2
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Configuration variables.
let g:_js_statusline_filepath_detail = 0
let g:_js_statusline_show_byte_and_syntax = 0

" Define color for status line alerts.
function! jeetlib#_UI_StatusLine_DefineSpecialHighlights()
    highlight! StatusLineAlert
        \ gui=NONE guifg=white guibg=firebrick3
        \ cterm=bold ctermfg=white ctermbg=red
    highlight! StatusLineUnalert
        \ gui=NONE guifg=#a0a090 guibg=#444444
        \ cterm=NONE ctermfg=black ctermbg=white
    highlight! link WindowLineNum StatusLine
    highlight! link StatusLineSeparator LineNr
endfunction

" Toggle file path detail.
function! jeetlib#_UI_StatusLine_CycleFilePathDetail()
    if g:_js_statusline_filepath_detail >= 2
        let g:_js_statusline_filepath_detail = 0
    else
        let g:_js_statusline_filepath_detail += 1
    endif
    if g:_js_statusline_filepath_detail >= 2
        echo "(statusline: full file path)"
    elseif g:_js_statusline_filepath_detail >= 1
        echo "(statusline: relative file path)"
    else
        echo "(statusline: file name only)"
    endif
endfunction

function! jeetlib#_UI_StatusLine_BufferNumIfModified()
    if &modified
        return ' ' . bufnr("%") . ' '
    else
        return ""
    endif
endfunction

function! jeetlib#_UI_StatusLine_BufferNumIfUnmodified()
    if !&modified
        return ' ' . bufnr("%") . ' '
    else
        return ""
    endif
endfunction

function! jeetlib#_UI_StatusLine_WindowNum()
    return ' ' . winnr() . " "
endfunction

" Compose status line.
function! jeetlib#_UI_StatusLine_Compose()

    " clear
    let l:line = ""

    " window number
    let l:line .= "%#StatusLineSeparator#|"
    let l:line .= "%#WindowLineNum#%{jeetlib#_UI_StatusLine_WindowNum()}"
    let l:line .= "%#StatusLineSeparator#|%0*"

    " buffer number
    let l:line .= "%#StatusLineAlert#%{jeetlib#_UI_StatusLine_BufferNumIfModified()}%0*"
    let l:line .= "%#StatusLineUnalert#%{jeetlib#_UI_StatusLine_BufferNumIfUnmodified()}%0*"
    let l:line .= "%#StatusLineSeparator#|%0*"

    " filepath
    let l:line .= ' "'
    if g:_js_statusline_filepath_detail >= 2
        let l:line .= '%F'
    elseif g:_js_statusline_filepath_detail >= 1
        let l:line .= '%f'
    else
        let l:line .= '%t'
    endif
    let l:line .= '" '

    " truncate here
    let l:line .= ' %<'

    " remainder of line is right-aligned
    let l:line .= '%='

    " file meta info
    let l:line .= "[%{strlen(&ft)?&ft: 'none'}|%{strlen(&fenc)?&fenc:&enc}|%{&fileformat}]"

    " " optional: byte value and syntax highlight type
    " if exists("g:_js_statusline_show_byte_and_syntax") && g:_js_statusline_show_byte_and_syntax
    "     set statusline+=\ \|\ chr\(%b\)
    "     set statusline+=\:\'%{synIDattr(synID(line('.'),col('.'),1),'name')}\'
    " endif

    " display info
    let l:line .= " ["
    let l:line .= "%{&wrap ?'+' : '-'}wrap|"
    let l:line .= "%{&expandtab ? '+' : '-'}xtab|"
    let l:line .= "%{&foldenable ? '+' : '-'}"
    if &foldmethod == "manual"
        let l:line .= "man"
    elseif &foldmethod == "indent"
        let l:line .= "ind"
    elseif &foldmethod == "expr"
        let l:line .= "exp"
    elseif &foldmethod == "marker"
        let l:line .= "mrk"
    elseif &foldmethod == "syntax"
        let l:line .= "syn"
    elseif &foldmethod == "diff"
        let l:line .= "dif"
    elseif &foldmethod == ""
        let l:line .= "---"
    else
        let l:line .= &foldmethod
    endif
    let l:line .= ":" . &foldlevel
    let l:line .= "]"

    " position
    let l:line .= " | "
    let line .= 'L:%l/%L, C:%c '

    " done
    return l:line

endfunction

" 2}}}

