" ----------------------------------------------------------
" MySnippet
" ----------------------------------------------------------

" environment
if has ('unix')
    let $DOT_VIM = expand("$HOME/.vim")
elseif has('win32') || has('win64')
    let $DOT_VIM = expand("$HOME/vimfiles")
endif

" read snippets file
if filereadable(expand("$DOT_VIM/snippets/snippets.vim"))
    source $DOT_VIM/snippets/snippets.vim
endif

let s:snippets = b:snippets

function! MySnippet() abort
    let l:word = expand("<cword>")
    let res =[]
    for key in keys(s:snippets)
        if l:word ==# key
            execute ":normal! ciw"
            let l:item = s:snippets[key]
            call add(res, s:snippets[key])
            call InsertContent(res)
        endif
    endfor
endfunction

function! InsertContent(item) abort
    let l:col = col('.')
    let l:i = 1
    let l:space = ""
    while l:i < l:col
        let l:space = l:space . " "
        let l:i += 1
    endwhile
    let l:elementList = []
    let l:preList = split(a:item[0], "\n")
    for item in l:preList
        let elem = substitute(item, '^', l:space, '')
        call add(l:elementList, elem)
    endfor
    if len(l:elementList) == 1
        let sitem = substitute(l:elementList[0], '^\s\+', '', '')
        execute ":normal a" . sitem
    else
        call append(line('.')-1, l:elementList)
    endif
    call search('\ze\$\zs\({1}\)', 'c')
    let pos = getpos('.')
    let pos[2] -= 1
    silent! %s/\$\({1}\)//g
    call setpos('.', pos)
    start
endfunction
