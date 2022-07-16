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
hi! Normal       ctermfg=15 guifg=#f6f3e8 guibg=#242424 gui=none
hi! NonText      ctermfg=NONE guifg=#808080 guibg=#303030 gui=none
hi! StatusLine   ctermfg=15 guifg=#333333 guibg=#f9f9f9 gui=none
hi! StatusLineNC ctermfg=0 guifg=#857b6f guibg=#444444 gui=none
hi! Terminal     ctermfg=15 guifg=lightgrey guibg=grey20
hi! LineNr       ctermfg=249  guifg=#857b6f guibg=#222222 gui=none
hi! StatusLineTerm ctermfg=7 ctermbg=15 guifg=#857b6f guibg=#000000 gui=none
hi! StatusLineTermNC ctermfg=0 ctermbg=0 guifg=#857b6f guibg=#444444 gui=none
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
hi! CursorIM     ctermfg=15 guifg=NONE guibg=#d10000
hi! EndOfBuffer  ctermfg=27 guifg=#888888

hi! DiffAdd ctermbg=29 ctermfg=158 guibg=#45493e guifg=#c0c5b9
hi! DiffChange ctermbg=23 ctermfg=159 guibg=#384851 guifg=#b3c3cc
hi! DiffDelete ctermbg=95 ctermfg=224 guibg=#53343b guifg=#ceb0b6
hi! DiffText cterm=NONE ctermbg=30 ctermfg=195 gui=NONE guibg=#5b7881 guifg=#c6c8d1

hi! MatchParen   ctermfg=8 ctermbg=123 guifg=#ffffff guibg=#00ffff
hi! link ParenMatch MatchParen
hi! Directory ctermfg=109 guifg=#89b8c2
hi! clear FoldColumn   
hi! SignColumn ctermbg=235 guibg=#333333
hi! FullWidthSpace ctermbg=8 guibg=#999689 
match FullWidthSpace /　/
"guibg=#222222 
hi! Pmenu        ctermfg=8 ctermbg=0
hi! PmenuSel     ctermfg=15 ctermbg=4
hi! PmenuSbar    ctermbg=0
hi! PmenuThumb   ctermbg=8
" Tabline
hi! TabLine cterm=NONE ctermbg=235 ctermfg=238 gui=NONE guibg=#0f1117 guifg=#3e445e
hi! TabLineFill cterm=reverse ctermbg=238 ctermfg=233 gui=reverse guibg=#3e445e guifg=#0f1117
"hi! TabLineSel cterm=NONE ctermbg=234 ctermfg=252 gui=NONE guibg=#161821 guifg=#9a9ca5

" Syntax highlighting
hi! Comment      ctermfg=244 guifg=#99968b gui=none
hi! Todo         ctermfg=214 guifg=#8f8f8f gui=italic
hi! Constant     ctermfg=111 guifg=#e5786d gui=none
" hi String       guifg=#ff69b4 gui=none
hi! String       ctermfg=230 guifg=#f5deb3 gui=none
hi! Identifier   ctermfg=111 guifg=#87cefa gui=none
hi! Function     ctermfg=117 guifg=#7cfc00 gui=none
hi! Type         ctermfg=112 guifg=#adff2f gui=none
hi! Statement    ctermfg=226 guifg=#ffff00 gui=none
hi! Keyword      ctermfg=111 guifg=#8ac6f2 gui=none
hi! PreProc      ctermfg=170 guifg=#ff69b4 gui=none
hi! Number       ctermfg=123 guifg=#00ffff gui=none
hi! Special      ctermfg=169 guifg=#ff69b4 gui=none

" mySyntax
hi myType        ctermfg=220 guifg=#ff69b4 gui=none

" elm
hi link elmType myType

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
hi link vimUsrCmd        Statement
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
hi link pythonInclude   Special
hi pythonOperator       guifg=#ff69b4
hi pythonQuotes         guifg=#cce6ff
hi pythonRepeat         guifg=#adff2f 
hi pythonString         ctermfg=230 guifg=#cce6ff

" HTML
hi htmlTag      ctermfg=15 guifg=#ffffff 
hi htmlEndTag	ctermfg=15 guifg=#ffffff
hi htmlArg      ctermfg=154 guifg=#adff2f 
hi htmlTagName	ctermfg=198  guifg=#5fffff
hi htmlH2       ctermfg=226 cterm=bold guifg=#FFF33f gui=bold
hi link htmlH1 htmlH2

" Markdown
hi markdownItalic ctermfg=225 cterm=bold guifg=#ffeaed gui=bold
hi markdownItalicDelimiter ctermfg=225 cterm=bold guifg=#ffeaed gui=bold
hi markdownBold ctermfg=226 cterm=bold guifg=#000000 gui=bold guibg=#ffd923
hi markdownBoldItalic ctermfg=226 cterm=bold guifg=#f6f3e8 gui=bold guibg=#e01616

" json
hi link jsonCommentError Comment

" sh
hi link shFunctionkey Statement
