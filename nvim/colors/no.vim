hi clear
syntax reset
let g:colors_name="no"

" variables
" let s:none 日本語 入力がおぼつかないのはなぜか
" let s:bg
let s:black =  "#333333"
let s:grey =   "#c0c0c0"
let s:green =  "#9acd32"
let s:white =  "#ffffff"
let s:yellow = "#ffd700"

hi Normal      guifg=#fffff guibg=NONE ctermbg=NONE
hi ModeMsg     guifg=NONE gui=bold
hi Directory   guifg=s:grey
hi Special     guifg=s:green
hi Visual      guibg=#a9a9a9 guifg=s:white    gui=bold
" Statuslineの背景色がIME入力中の背景色になってしまう
hi Statusline   guifg=#ffffff guibg=none ctermfg=255 ctermbg=none


" netrw
hi link netrwClassify Directory
"
" treesitter
if has('nvim-0.8')
  hi @keyword    guifg=#dcdcdc
  hi @variable    guifg=#ffffff
  hi @variable.member    guifg=#dcdcdc
  hi @function.call    guifg=#f5f5f5
  hi @function.builtin    guifg=#f5f5f5
  hi @string      guifg=s:white
  hi @punctuation guifg=s:white
  hi @parameter   guifg=s:white
  hi @include     guifg=s:white gui=bold
  hi @property    guifg=s:white
  hi @field       guifg=s:white
  hi link @markup.raw.block Normal      
endif

set background=dark
