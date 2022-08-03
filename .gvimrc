scriptencoding utf-8

"set guioptions-=m               " メニューバーの非表示
set guioptions-=T               " ツールバーの非表示
set guioptions-=l               " 右スクロールバーの非表示
set guioptions-=L               " 分割時の左スクロールバーの非表示
set guioptions-=r               " 右スクロールバーの非表示
set guioptions-=R               " 分割時右スクロールバーの非表示
set guioptions-=b               " 下スクロールバーの非表示
set visualbell t_vb=            " ビープ音を鳴らさない
set mouse=a                     " どのモードでもマウスを使えるようにする
set nomousefocus                " マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set mousehide                   " 入力時にマウスポインタを隠す (nomousehide:隠さない)
" au GUIEnter * simalt ~x
" set shell=C:/WINDOWS/System32/bash.exe
" set shellcmdflag=-c
" set shellquote=\"
" set shellxescape=
" set shellxquote=

" フォントの設定
" set guifont=Monaco:h11:w6:cANSI:qDRAFT guifontwide=Migu_1M:h12:w6:cSHIFTJIS:qDRAFT
if has('unix')
    " set guifont=HackGen\ 12
    " set guifont=migu1m\ 12
    " set guifont=Monaco\ 12 guifontwide=Migu1M\ 12
        " \ guifontwide=Migu\ 1M\ h13
    set guifont=Migu1MClone\ 13
 
elseif has('win32') || has('win64')
    " set guifont=Ricty_Diminished_for_Powerline\ h14\ w6\ cANSI:qDRAFT\ guifontwide=Migu_1M\ h13\ w6\ cSHIFTJIS\ qDRAFT
    " set guifont=Ricty_Diminished_with-icons:h14:w6:cSHIFTJIS:qDRAFT "guifontwide=Migu_1M:h13:w6:cSHIFTJIS:qDRAFT
    " set guifont=Menlo:h12:w6:cANSI:qDRAFT guifontwide=Migu_1M:h13:w6:cSHIFTJIS:qDRAFT
    " set guifont=Menlo:h12:w6:cANSI:qDRAFT guifontwide=Migu_1M:h13:cSHIFTJIS:qDRAFT
    " set guifont=DejaVuSansMono\ 11
    set guifont=Monaco:h14:w6:cANSI:qDRAFT guifontwide=Migu_1M:h13:w6:cSHIFTJIS:qDRAFT
    " set guifont=Meslo_LG_S:h13:w6:cANSI:qDRAFT guifontwide=Migu_1M:h12:w6:cSHIFTJIS:qDRAFT
endif

" colorscheme
" colorscheme iceberg
colorscheme mycolor

" IMEがOnのときはカーソルの色を変える
if has('multi_byte_ime')
    " highlight Cursor guifg=NONE guibg=#a8b2b1
    highlight CursorIM guifg=NONE guibg=#d10000
endif

" if has('win32') || has ('win64')
"     source $VIMRUNTIME/delmenu.vim
"     set langmenu=ja_jp.utf-8
"     source $VIMRUNTIME/menu.vim
" endif

" ウインドウサイズを保存して次回採用する
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
            \ 'set columns=' . &columns,
            \ 'set lines=' . &lines,
            \ 'winpos ' . 0 . ' ' . getwinposy(),
            \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END

"            \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
endif
