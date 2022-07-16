" file type plugin Ruby

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
