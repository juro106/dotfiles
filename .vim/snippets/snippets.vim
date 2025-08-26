echo "load .vim/snippets/snippets.vim"

" スニペット定義。カーソル位置は $ で指定
let g:snippets = {
    \ 'front': [
    \    "draft: true",
    \    "title: '$'",
    \    "description: ''",
    \    "datePublished: '" . strftime("%Y-%m-%dT%H:%M:%S+09:00") . "'",
    \    "dateModified:  ''",
    \    "tags:",
    \ ],
    \ 'htmlcomment': [
    \   '<!-- ' . strftime("%Y-%m-%dT%H:%M:%S+09:00") . ' -->',
    \   '$'
    \ ],
    \ '!': [
    \   "<!DOCTYPE html>",
    \    "<html lang=\"ja\">",
    \    "<head>",
    \    "\t<meta charset=\"utf-8\">",
    \    "\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
    \    "\t<meta name=\"description\" content=\"\">",
    \    "\t<title></title>",
    \    "</head>",
    \    "\t<body>",
    \    "\t\t$",
    \    "\t</body>",
    \    "</html>",
    \],
    \}

function! ExpandSnippet() abort
    let l:lnum = line('.')
    let l:line = getline(l:lnum)
    let l:word = expand('<cword>')
    let l:word_len = strlen(l:word)

    " 単語開始位置 = カーソル位置 - 単語長
    let l:start_col = col('.') - 1 - l:word_len
    if l:start_col < 0
        let l:start_col = 0
    endif

    " 単語を削除（正確）
    let l:newline = strpart(l:line, 0, l:start_col) . strpart(l:line, l:start_col + l:word_len)
    call setline(l:lnum, l:newline)

    " カーソルを単語先頭に戻す
    call cursor(l:lnum, l:start_col + 1)

    " --- スニペット展開 ---
    if has_key(g:snippets, l:word)
        let l:snippet = copy(g:snippets[l:word])
        call append(l:lnum - 1, l:snippet)

        " $ マーカーがあればその位置にカーソル
        for i in range(len(l:snippet))
            let idx = stridx(l:snippet[i], '$')
            if idx >= 0
                let row = l:lnum + i
                call setline(row, strpart(l:snippet[i], 0, idx) . strpart(l:snippet[i], idx + 1))
                call cursor(row, idx + 1)
                return
            endif
        endfor

        " $ がなければスニペット先頭にカーソル
        call cursor(l:lnum + 1, 1)
        return
    endif


  " --- 任意タグ展開 ---
    let col0 = col('.') - 1
    let line0 = getline(lnum)
    let tag = '<' . word . '></' . word . '>'
    let before = strpart(line0, 0, col0)
    let after  = strpart(line0, col0)
    call setline(lnum, before . tag . after)

    " カーソルは開きタグ内の先頭
    call cursor(lnum, col0 + strlen('<' . word . '>') + 1)
endfunction

" インサートモードで <C-y>, で展開
inoremap <silent> <C-y>, <C-o>:call ExpandSnippet()<CR>

