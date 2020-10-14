set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "mycolor"

" Vim >= 7.0 specific colors
if version >= 700
    hi CursorLine       guibg=#A09F9F
    hi CursorColumn     guibg=#ffffff
    hi MatchParen       guifg=#ffffff guibg=#00ffff gui=bold
    hi Pmenu            guifg=#f6f3e8 guibg=#444444
    hi PmenuSel         guifg=#000000 guibg=#cae682
endif

" General colors
hi! Cursor       ctermfg=13 guifg=#f6f3e8 guibg=#ff99ff gui=none
hi! Normal       guifg=#f6f3e8 guibg=#242424 gui=none
hi! NonText      ctermbg=234 ctermfg=236 guifg=#808080 guibg=#303030 gui=none
hi! LineNr       guifg=#857b6f guibg=#222222 gui=none
hi! StatusLine   guifg=#333333 guibg=#f9f9f9 gui=none
hi! StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi! Terminal     guifg=lightgrey guibg=grey20
hi! StatusLineTerm guifg=#857b6f guibg=#000000 gui=none
hi! StatusLineTermNC guifg=#857b6f guibg=#444444 gui=none
hi! CursorLineNr ctermfg=245 term=bold cterm=NONE ctermbg=NONE guifg=#f2f230
hi! VertSplit    guifg=#555555 guibg=#555555 gui=none
hi! Folded       guibg=#384048 guifg=#a0a8b0 gui=none
hi! Title        guifg=#f6f3e8 guibg=NONE    gui=bold
hi! Visual       ctermfg=255 ctermbg=245 guifg=#ffffff guibg=#A09F9F gui=none
" hi Visual       guifg=#254080 guibg=#ffbd7a gui=none
hi! SpecialKey   guifg=#87cefe guibg=#343434 gui=none
hi! IncSearch    ctermbg=220 guifg=#254080 guibg=#ffd700 gui=none
hi! Search       ctermbg=220 guifg=#254080 guibg=#ffd700 gui=none
hi! hlsearch     ctermbg=220 guifg=#254080 guibg=#ffd700 gui=none

hi! DiffAdd ctermbg=29 ctermfg=158 guibg=#45493e guifg=#c0c5b9
hi! DiffChange ctermbg=23 ctermfg=159 guibg=#384851 guifg=#b3c3cc
hi! DiffDelete ctermbg=95 ctermfg=224 guibg=#53343b guifg=#ceb0b6
hi! DiffText cterm=NONE ctermbg=30 ctermfg=195 gui=NONE guibg=#5b7881 guifg=#c6c8d1

hi! MatchParen   ctermfg=255 ctermbg=123 guifg=#ffffff guibg=#00ffff
hi! link ParenMatch MatchParen
hi! Directory ctermfg=109 guifg=#89b8c2
hi! clear FoldColumn   
hi! FullWidthSpace ctermbg=227 guibg=#999689 
match FullWidthSpace /　/
"guibg=#222222 
hi! Pmenu        ctermfg=8 ctermbg=0
hi! PmenuSel     ctermfg=15 ctermbg=4
hi! PmenuSbar    ctermbg=0
hi! PmenuThumb   ctermbg=8

" Syntax highlighting
hi! Comment      ctermfg=8 guifg=#99968b gui=none
hi! Todo         ctermfg=214 guifg=#8f8f8f gui=italic
hi! Constant     ctermfg=111 guifg=#e5786d gui=none
" hi String       guifg=#ff69b4 gui=none
hi! String       ctermfg=230 guifg=#f5deb3 gui=none
hi! Identifier   ctermfg=111 guifg=#87cefa gui=none
hi! Function     ctermfg=123  guifg=#7cfc00 gui=none
hi! Type         ctermfg=112 guifg=#adff2f gui=none
hi! Statement    ctermfg=226 guifg=#ffff00 gui=none
hi! Keyword      ctermfg=111 guifg=#8ac6f2 gui=none
hi! PreProc      ctermfg=170 guifg=#ff69b4 gui=none
hi! Number       ctermfg=123 guifg=#00ffff gui=none
hi! Special      ctermfg=169 guifg=#ff69b4 gui=none

" Vim
hi vimSynType       guifg=#ffbd7a
hi vimSynRegPat     guifg=#ff69b4
hi vimPatSep        guifg=#87cefa
hi vimGroup         ctermfg=112  guifg=#ffbd7a
hi vimHiGroup       guifg=#b0eb57
hi vimHiGuiFgBg     guifg=#f5deb3
hi vimFuncName      guifg=#87cefa
hi vimMapModKey     ctermfg=112 guifg=#b0eb57
hi vimMapMod        ctermfg=112 guifg=#b0eb57
hi vimString        guifg=#e0eaec
hi vimOption        ctermfg=223 guifg=#f5deb3
hi link vimOper Special
hi link vimVar Identifier
hi link vimFunction Function

" Python
hi pythonBuiltin        guifg=#f6cef5 gui=bold
hi pythonConditiona     guifg=#ffd700
hi pythonDecorator      guifg=#ff69b4
hi pythonDelimiter      guifg=#ffc0cd
hi pythonException      guifg=#ffff00
hi pythonExceptions     guifg=#ffbd7a
hi pythonInclude        guifg=#ff69d4 gui=bold
hi pythonOperator       guifg=#ff69b4
hi pythonQuotes         guifg=#cce6ff
hi pythonRepeat         guifg=#adff2f 
hi pythonString         guifg=#cce6ff

" HTML
hi htmlTag      guifg=#f5deb3 
hi htmlEndTag	guifg=#f5deb3
hi htmlTagName	guifg=#87cefa
hi htmlH2       guifg=#FFF33f gui=bold

" Markdown
hi markdownItalic guifg=#ffeaed gui=bold
hi markdownItalicDelimiter guifg=#ffeaed gui=bold
hi markdownBold guifg=#000000 gui=bold guibg=#ffd923
hi markdownBoldItalic guifg=#f6f3e8 gui=bold guibg=#e01616

" json
hi link jsonCommentError Comment
