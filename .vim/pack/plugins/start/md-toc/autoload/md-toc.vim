vim9script

# ----------------------------------------------------------
# 見出し一覧を抽出
# ----------------------------------------------------------

function! Toc() abort
    # 全行コピー
    var preTexts = join(getline(1, "$"), "\n")
    # 見出しリスト
    var l:headingList = []

    # echo l:preTexts
    var l:texts = substitute(l:preTexts, '```\_.\{-}```', '', 'g')
    var l:lines = split(texts, "\n")

    # １行ずつ置換
    for line in l:lines
        # # で始まる行だけを抽出して置換して見出しリストへ追加
        # if len(matchstr(line, '#')) > 0
        if match(line, '^#') !=# -1
            var line = substitute(line, '#\+\s\+\zs\(.*\)\ze\s\+{', '\[\1\]', '')
            var line = substitute(line, '\s\+{\(.*\)}', '(\1)', '')
            var line = substitute(line, '^## ', '- ## ', '')
            var line = substitute(line, '^### ', '    - ### ', '')
            var line = substitute(line, '^#### ', '        - #### ', '')
            call add(l:headingList, line)
        endif
    endfor

    call insert(l:headingList, '{{<toc>}}', 0)
    call insert(l:headingList, '<p id="toc-title">目次</p>', 1)
    call insert(l:headingList, '', 2)
    call add(l:headingList, '')
    call add(l:headingList, '{{</toc>}}')
    call append(line('.')-1, l:headingList)

endfunction

# 目次

command! -nargs=? Mkz call ToggleOutline(<f-args>)

nnoremap <F9> :<C-u>Mkz<CR>

function! ToggleOutline() abort
    
    if bufexists('Outline')
        call <SID>DeleteOutline()
        return
    endif

    if !exists("l:mkz_open_left")
        var mkz_open_left = 0
    endif
    if !exists("l:mkz_focus")
        var mkz_focus = 0
    endif

    if !exists("l:mkz_width")
        var l:mkz_width=60
    endif

    var l:lines = getline(1,"$")

    if !exists("b:regex_command")
        call <SID>HeadingSet()
    endif

    var l:regex_command = b:regex_command

    if l:mkz_open_left == 0
        setlocal splitright
    endif
    exec "vertical ".l:mkz_width." split Outline"

    var l:i=1
    while l:i < len(l:lines)+1
        call setline(l:i,l:lines[l:i-1]."  ".l:i)
        var l:i += 1
    endwhile
    
    for cmd in l:regex_command
        exec "silent!".cmd
    endfor
    call append(0, "▼ Heading")

    setlocal statusline=[OUTLINE]
    setlocal filetype=mkz
    setlocal nonumber
    setlocal buftype=nofile
    setlocal noswf
    setlocal bufhidden=unload

    # syntax match bar /| / contained
    syntax match headingH1 /^\zs[^|]*\ze  \d*$/
    syntax match headingNormal /| \zs[^|]*\ze  \d*$/
    syntax match headingBold /^| \zs[^|]*\ze  \d*$/
    syntax match jumpNumber /  \zs\d*$/ contained

    syn region highlightHeading start="^" end="  \d*$" keepend oneline contains=jumpNumber,bar,headingBold,headingNormal,headingH1

    hi link highlightHeading Comment
    # hi link bar Comment
    hi link jumpNumber Comment
    hi headingH1 Normal
    hi headingNormal ctermfg=254 guifg=#fefefe
    hi link headingBold htmlBold

    nnoremap <silent> <buffer> <CR> :<C-u>call <SID>JumpToHeading()<CR>
    nnoremap <silent> <buffer> q :<C-u>call <SID>DeleteOutline()<CR>
    cnoremap <silent> <buffer> q <C-u>call <SID>DeleteOutline()<CR>

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
    
    # echo 'open' 
endfunction

function! s:JumpToHeading() abort
    var l:line = getline(".")
    var l:jumpline = matchstr(l:line, '\d\+$')
    wincmd p
    exec l:jumpline
    normal zz
endfunction

function! s:HeadingSet() abort
    if (&ft == 'markdown' || &ft == 'md')
        var b:regex_command=[ ''
            \, '%s/```\_.\{-}```//'
            \, '%s/\v-+(\_.{-})\n-+/\r\1\r/'
            \, '%s/\v\++(\_.{-})\n\++/\r\1\r/'
            \, '%s/\v(.*)\n\=+(\ \ \d+)/\r# \1/'
            \, '%s/\v(.*)\n-+(\ \ \d+)/\r## \1/'
            \, '%s/^h1: /# /'
            \, 'g!/\v^title: |^#|\<h[1-6]\>/d'
            \, '%s/^title: /Title /'
            \, '%s/^# //'
            \, '%s/^## /| /'
            \, '%s/^### /| | /'
            \, '%s/^#### /| | | /'
            \, '%s/^##### /| | | | /'
            \, '%s/^###### /| | | | | /'
            \, ]
            # \, '%s/\v.*\<h1[^\>]*\>/# /'
            # \, '%s/\v.*\<h2[^\>]*\>/## /'
            # \, '%s/\v.*\<h3[^\>]*\>/### /'
            # \, '%s/\v.*\<h4[^\>]*\>/#### /'
            # \, '%s/\v.*\<h5[^\>]*\>/##### /'
            # \, '%s/\v.*\<h6[^\>]*\>/###### /'
            # \, '%s/<.*>//g'
            # \, '%s/<\/.*>//g'
            # \, "%s/'//g"
            # \, '%s/\"//g'
    elseif (&ft == 'html')
        var b:regex_command=['g!/^\s*\<h1\|<h2\|<h3\|<h4\|<h5\|<h6/d'
            \, '%s/<\/h1>\|<\/h2>\|<\/h3>\|<\/h4>\|<\/h5>\|<\/h6>//'
            \, '%s/\v\<a[^\>]*\>//'
            \, '%s/<\/a>//'
            \, '%s/\v\<div[^\>]*\>//'
            \, '%s/<\/div>//'
            \, '%s/\v\<span[^\>]*\>//'
            \, '%s/<\/span>//'
            \, '%s/\v\<p[^\>]*\>//'
            \, '%s/<\/p>//'
            \, "%s/'//g"
            \, '%s/\"//g'
            \, '%s/\v\<h1[^\>]*\>/# /'
            \, '%s/\v\<h2[^\>]*\>/## /'
            \, '%s/\v\<h3[^\>]*\>/### /'
            \, '%s/\v\<h4[^\>]*\>/#### /'
            \, '%s/\v\<h5[^\>]*\>/##### /'
            \, '%s/\v\<h6[^\>]*\>/###### /'
            \, '%s/^# /H1 /'
            \, '%s/^## /| H2 /'
            \, '%s/^### /| | H3 /'
            \, '%s/^#### /| | | H4 /'
            \, '%s/^##### /| | | | H5 /'
            \, '%s/^###### /| | | | | H6 /'
            \, ]
    else
        var b:regex_command=['g!/^\*/d','%s/\[.\+\]//','%s/^\(\*\+\)\s*/\1/','%s/^\*//','%s/\*/  /g']
    endif
endfunction

function! s:DeleteOutline() abort
    bw Outline
    # echo 'close'
endfunction

