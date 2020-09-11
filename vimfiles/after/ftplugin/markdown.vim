" ----------------------------------------------------------
" autodate.vim
" ----------------------------------------------------------
let autodate_keyword_pre="dateModified: '"
let autodate_keyword_post="'"
let autodate_format="%Y-%m-%dT%H:%M:%S+09:00"

" ----------------------------------------------------------
" 見出し一覧を抽出
" ----------------------------------------------------------
function! Toc() abort
    " 全行コピー
    let l:lines = getline(1, "$")
    " 見出しリスト
    let l:headingList = []

    " １行ずつ置換
    for line in l:lines
        " # で始まる行だけを抽出して置換して見出しリストへ追加
        if len(matchstr(line, '#')) > 0
            let line = substitute(line, '#\+\s\+\zs\(.*\)\ze\s\+{', '\[\1\]', '')
            let line = substitute(line, '\s\+{\(.*\)}', '(\1)', '')
            let line = substitute(line, '^## ', '- ## ', '')
            let line = substitute(line, '^### ', '    - ### ', '')
            let line = substitute(line, '^#### ', '        - #### ', '')
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

" ----------------------------------------------------------
" Snippet
" ----------------------------------------------------------
if filereadable(expand('~/vimfiles/autoload/mysnippets.vim'))
    source ~/vimfiles/autoload/mysnippets.vim
endif
