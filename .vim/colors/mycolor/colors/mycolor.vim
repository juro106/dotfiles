set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "mycolor"

" Vim >= 7.0 specific colors
if version >= 700
    hi CursorLine       guibg=#A09F9F
    hi CursorColumn     guibg=#ffffff
    hi MatchParen       guifg=#ffffff guibg=#00ffff gui=bold
    hi Pmenu            guifg=#f6f3e8 guibg=#444444
    hi PmenuSel         guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor       guifg=#f6f3e8 guibg=#ff99ff gui=none
hi Normal       guifg=#f6f3e8 guibg=#242424 gui=none
hi NonText      guifg=#808080 guibg=#303030 gui=none
hi LineNr       guifg=#857b6f guibg=#222222 gui=none
hi StatusLine   guifg=#f6f3e8 guibg=#444444 gui=italic
hi CursorLineNr term=bold cterm=NONE ctermfg=227 ctermbg=NONE guifg=#f2f230
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi VertSplit    guifg=#444444 guibg=#444444 gui=none
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=none
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold
hi Visual       guifg=#ffffff guibg=#A09F9F gui=none
" hi Visual       guifg=#254080 guibg=#ffbd7a gui=none
hi SpecialKey   guifg=#87cefe guibg=#343434 gui=none
hi IncSearch    guifg=#254080 guibg=#ffd700 gui=none
hi Search       guifg=#254080 guibg=#ffd700 gui=none
hi hlsearch     guifg=#254080 guibg=#ffd700 gui=none
hi MatchParen   guifg=#ffffff guibg=#00ffff gui=bold
hi Directory    ctermbg=109 guifg=#a4d7e2 gui=none

" Syntax highlighting
hi Comment      guifg=#99968b gui=italic
hi Todo         guifg=#8f8f8f gui=italic
hi Constant     guifg=#e5786d gui=none
" hi String       guifg=#ff69b4 gui=none
hi String       guifg=#f5deb3 gui=none
hi Identifier   guifg=#87cefa gui=none
hi Function     guifg=#7cfc00 gui=none
hi Type         guifg=#adff2f gui=none
hi Statement    guifg=#ffff00 gui=none
hi Keyword      guifg=#8ac6f2 gui=none
hi PreProc      guifg=#ff69b4 gui=none
hi Number       guifg=#00ffff gui=none
hi Special      guifg=#ff69b4 gui=none

" color code
" skyblue=#87cefa
" violet=#ff69b4
" gold=#ffd700
" orange=#ffbd7a
" pink=#ffc0cd
" green=#adff2f

"Vim
hi vimSynType       guifg=#ffbd7a
hi vimSynRegPat     guifg=#ff69b4
hi vimPatSep        guifg=#87cefa
hi vimGroup         guifg=#ffbd7a
hi vimHiGroup       guifg=#adff2f
hi vimHiGuiFgBg     guifg=#f5deb3
hi vimFuncName      guifg=#87cefa
hi vimMapModKey     guifg=#adff2f
hi vimMapMod        guifg=#adff2f
hi vimOper          guifg=#ff69b4
hi vimString        guifg=#87cefa
hi vimOption        guifg=#f5deb3

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
"hi pythonAsync
"hi pythonComment
"hi pythonDecoratorName
"hi pythonEscape
"hi pythonFunction
"hi pythonRawString
"hi pythonRepeat        guifg=#
"hi pythonSpecialWord   
"hi pythonStatement     guifg=#
"hi pythonTodo
"hi pythonTripleQuotes

" HTML
hi htmlTag      guifg=#f5deb3 
hi htmlEndTag	guifg=#f5deb3
hi htmlTagName	guifg=#87cefa
hi htmlH2       guifg=#FFF33f gui=bold
" Unite.vim
hi uniteSource__FileMru   guifg=#FFFFFF
hi uniteCandidateIcon guifg=#FFFFFF
hi link uniteInputPrompt Statement
hi uniteInputLine guifg=#ffffff
hi uniteCandidateSourceName guifg=#ffc700
hi uniteStatusSourceNames guifg=#aaf263 guibg=#444444
hi uniteStatusSourceCandidates  guifg=#aaf263 guibg=#444444
hi link uniteCandidateInputKeyword Statement

" vimfiler
hi link vimfilerClosedFile Normal

" NERDTree
hi link NERDTreeHelp vimOption 
hi NERDTreeDir guifg=#f0ddb6
hi NERDTreeOpenable guifg=#adff2f
hi NERDTreeClosable guifg=#adff2f

" UniteOutline
hi uniteSource__Outline_level_1 guifg=#f4e9d4
hi uniteSource__Outline_level_2 guifg=#f4e9d4
hi uniteSource__Outline_level_3 guifg=#f4e9d4
hi uniteSource__Outline_level_4 guifg=#f4e9d4
hi uniteCandidateIcon           guifg=#87cefa

" Markdown
hi markdownItalic guifg=#ffeaed gui=bold
hi markdownItalicDelimiter guifg=#ffeaed gui=bold
hi markdownBold guifg=#000000 gui=bold guibg=#ffd923
hi markdownBoldItalic guifg=#f6f3e8 gui=bold guibg=#e01616
