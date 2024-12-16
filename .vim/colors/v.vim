set background=dark

if exists("syntax_on")
    syntax
endif

hi clear

let g:colors_name = "v"

" General colors
hi Normal       ctermfg=15 guifg=#f6f3e8 guibg=#242424 gui=none
hi Cursor       ctermfg=13 guifg=#f6f3e8 guibg=#ff99ff gui=none
hi Comment      ctermfg=244 guifg=#99968b gui=none
hi NonText      ctermfg=NONE guifg=#808080 guibg=#303030 gui=none
hi StatusLine   ctermfg=15 guifg=#333333 guibg=#f9f9f9 gui=none
hi StatusLineNC ctermfg=0 guifg=#857b6f guibg=#444444 gui=none
hi Terminal     ctermfg=15 guifg=lightgrey guibg=grey
hi LineNr       ctermfg=249  guifg=#857b6f guibg=#222222 gui=none
hi StatusLineTerm ctermfg=7 ctermbg=15 guifg=#857b6f guibg=#000000 gui=none
hi StatusLineTermNC ctermfg=0 ctermbg=0 guifg=#857b6f guibg=#444444 gui=none
hi CursorLineNr ctermfg=245 term=bold cterm=NONE ctermbg=NONE guifg=#f2f230
hi VertSplit    guifg=#555555 guibg=#555555 gui=none
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=none
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold
hi Visual       ctermfg=255 ctermbg=245 guifg=#ffffff guibg=#A09F9F gui=none
hi SpecialKey   guifg=#87cefe guibg=#343434 gui=none
hi IncSearch    ctermbg=220 guifg=#254080 guibg=#ffd700 gui=none
hi Search       ctermbg=220 guifg=#254080 guibg=#ffd700 gui=none
hi hlsearch     ctermbg=220 guifg=#254080 guibg=#ffd700 gui=none
hi CursorIM     ctermfg=15 guifg=NONE guibg=#d10000
hi EndOfBuffer  ctermfg=27 guifg=#888888

hi DiffAdd ctermbg=29 ctermfg=158 guibg=#45493e guifg=#c0c5b9
hi DiffChange ctermbg=23 ctermfg=159 guibg=#384851 guifg=#b3c3cc
hi DiffDelete ctermbg=95 ctermfg=224 guibg=#53343b guifg=#ceb0b6
hi DiffText cterm=NONE ctermbg=30 ctermfg=195 gui=NONE guibg=#5b7881 guifg=#c6c8d1

hi MatchParen   ctermfg=8 ctermbg=123 guifg=#ffffff guibg=#00ffff
hi link ParenMatch MatchParen
hi Directory ctermfg=109 guifg=#89b8c2
hi clear FoldColumn   
hi SignColumn ctermbg=235 guibg=#333333
hi FullWidthSpace ctermbg=8 guibg=#999689 
match FullWidthSpace /　/

"guibg=#222222 
hi Pmenu        ctermfg=8 ctermbg=0
hi PmenuSel     ctermfg=15 ctermbg=4
hi PmenuSbar    ctermbg=0
hi PmenuThumb   ctermbg=8

" Tabline
hi TabLine cterm=NONE ctermbg=235 ctermfg=238 gui=NONE guibg=#0f1117 guifg=#3e445e
hi TabLineFill cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#0f1117

