" file type plugin Markdown
" ----------------------------------------------------------
" environment
" ----------------------------------------------------------
if has('win32') || has('win64')
    let $DOT_VIM = expand("$HOME/vimfiles")
else
    let $DOT_VIM = expand("$HOME/.vim")
endif

" ----------------------------------------------------------
" Snippet
" ----------------------------------------------------------
if filereadable(expand("$DOT_VIM/autoload/mysnippets.vim"))
    source $DOT_VIM/autoload/mysnippets.vim
endif

" ----------------------------------------------------------
" autodate.vim
" ----------------------------------------------------------
let b:autodate_keyword_pre="dateModified: '"
let b:autodate_keyword_post="'"
let b:autodate_format="%Y-%m-%dT%H:%M:%S+09:00"

" ----------------------------------------------------------
" 見出し一覧を抽出
" ----------------------------------------------------------
"
command! -nargs=? Toc call <SID>Toc(<f-args>)

function! s:Toc(...) abort
    " 全行コピー
    let l:preTexts = join(getline(1, "$"), "\n")
    " 見出しリスト
    let l:headingList = ['{{<toc>}}', '<p id="toc-title">目次</p>', '']

    " 先に余計なものを排除. コード内のコメントの # を消す
    let l:texts = substitute(l:preTexts, '```\_.\{-}```', '', 'g')
    let l:lines = split(texts, "\n")

    let arg = a:0 >= 1 ? a:1 : 4

    " １行ずつ置換
    for line in l:lines
        " # で始まる行だけを抽出して置換して見出しリストへ追加
        " if len(matchstr(line, '^#')) > 0 よりも match(line, '^#') !=# -1 のほうが確実らしい
        if arg == 2
            if match(line, '^## ') !=# -1
                let line = substitute(line, '#\+\s\+\zs\(.*\)\ze\s\+{', '\[\1\]', '')
                let line = substitute(line, '\s\+{\(.*\)}', '(\1)', '')
                let line = substitute(line, '^## ', '- ## ', '')
                call add(l:headingList, line)
            endif
        endif
        if arg == 3
            if match(line, '^## ') !=# -1 || match(line, '^### ') !=# -1
                let line = substitute(line, '#\+\s\+\zs\(.*\)\ze\s\+{', '\[\1\]', '')
                let line = substitute(line, '\s\+{\(.*\)}', '(\1)', '')
                let line = substitute(line, '^## ', '- ## ', '')
                let line = substitute(line, '^### ', '    - ### ', '')
                call add(l:headingList, line)
            endif
        endif
        if arg == 4
            if match(line, '^##') !=# -1
                let line = substitute(line, '#\+\s\+\zs\(.*\)\ze\s\+{', '\[\1\]', '')
                let line = substitute(line, '\s\+{\(.*\)}', '(\1)', '')
                let line = substitute(line, '^## ', '- ## ', '')
                let line = substitute(line, '^### ', '    - ### ', '')
                let line = substitute(line, '^#### ', '        - #### ', '')
                call add(l:headingList, line)
            endif
        endif
    endfor
    " call add(l:headingList, '')
    call add(l:headingList, '{{</toc>}}')
    call append(line('.')-1, l:headingList)
endfunction

" 目次

command! -nargs=? Mkz call <SID>ToggleOutline(<f-args>)

nnoremap <F9> :<C-u>Mkz<CR>

function! s:ToggleOutline() abort
    
    if bufexists('Outline')
        call s:DeleteOutline()
        return
    endif

    if !exists("l:mkz_open_left")
        let mkz_open_left = 0
    endif

    if !exists("l:mkz_focus")
        let mkz_focus = 0
    endif

    if !exists("l:mkz_width")
        let l:mkz_width=60
    endif

    " 先に全ての行を取得
    let l:lines = getline(1,"$")

    " 行を取得してからオープン
    if l:mkz_open_left == 0
        setlocal splitright
    endif

    exec "vertical " . l:mkz_width . " split Outline"

    " 行番号を付与
    let l:preList = [""]
    let l:j=1
    for line in l:lines
        call add(l:preList, line . "  " . l:j)
        let l:j += 1
    endfor

    " 一旦まとめて余計なものを排除。コード内の # を消す
    let l:texts = substitute(join(l:preList, "\n"), '```\_.\{-}```', '', 'g')
    let l:newLines = split(texts, "\n") 
    let l:headingList = ["▼ Heading"]

    for line in l:newLines
        " # で始まる行だけを抽出して置換して見出しリストへ追加
        " if len(matchstr(line, '#')) > 0
        if match(line, '^#') !=# -1
            let line = substitute(line, '^# ',     '', '')
            let line = substitute(line, '^## ',    '| ', '')
            let line = substitute(line, '^### ',   '| | ',  '')
            let line = substitute(line, '^#### ',  '| | | ', '')
            let line = substitute(line, '^##### ', '| | | |', '')
            call add(l:headingList, line)
        endif
    endfor
    call append(line('.')-1, l:headingList)

    setlocal statusline=[OUTLINE]
    setlocal filetype=mkz
    setlocal nonumber
    setlocal buftype=nofile
    setlocal noswf
    setlocal bufhidden=unload

    " syntax match bar /| / contained
    syntax match headingH1 /^\zs[^|]*\ze  \d*$/
    syntax match headingNormal /| \zs[^|]*\ze  \d*$/
    syntax match headingBold /^| \zs[^|]*\ze  \d*$/

    syn region highlightHeading start="^" end="  \d*$" keepend oneline contains=jumpNumber,bar,headingBold,headingNormal,headingH1

    hi link highlightHeading Comment
    hi link headingH1 Normal
    hi headingNormal ctermfg=254 guifg=#fefefe
    hi link headingBold htmlBold

    nnoremap <silent> <buffer> <CR> :<C-u>call <SID>JumpToHeading()<CR>
    nnoremap <silent> <buffer> q :<C-u>call <SID>DeleteOutline()<CR>
    cnoremap <silent> <buffer> q <C-u>call <SID>DeleteOutline()<CR>
    nnoremap <silent> <buffer> <Space>b <Nop>

    augroup outline
        autocmd!
        autocmd Bufleave <buffer> setlocal nobuflisted
        autocmd VimLeavePre <buffer> setlocal nobuflisted
        autocmd WinEnter * if (winnr("$") == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'nofile' | quit | endif
    augroup END

    setlocal nomodifiable
    setlocal readonly

    if l:mkz_open_left==0 && l:mkz_focus==0
        wincmd h
    elseif l:mkz_open_left==0 && l:mkz_focus==1
        wincmd l 
    elseif l:mkz_open_left==1 && l:mkz_focus==0
        wincmd l
    elseif l:mkz_open_left==1 && l:mkz_focus==1
        wincmd h 
    endif
endfunction

function! s:JumpToHeading() abort
    let l:line = getline(".")
    let l:jumpline = matchstr(l:line, '\d\+$')
    wincmd p
    exec l:jumpline
    normal zz
endfunction

function! s:DeleteOutline() abort
    bw Outline
endfunction
