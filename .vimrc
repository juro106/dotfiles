set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
" set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
" set shellslash
set guioptions+=M               " $VIMRUTIME/menu.vimを読み込まない
set guioptions+=k               " タブなどの追加時にウインドウサイズ等を維持
set guioptions-=e               " Gvim でもテキストベースのタブを使う
set langmenu=none

filetype plugin indent on

let g:no_gvimrc_example         = 1
let g:no_vimrc_example          = 1
let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:skip_loading_mswin        = 1

let plugin_cmdex_disable        = 1 " 雑多なコマンド
let plugin_dicwin_disable       = 1 " 辞書
let plugin_format_disable       = 1 " $VIMRUNTIME/plugin/format.vim
let plugin_hz_ja_disable        = 1 " $VIM/plugins/kaoriya/hz_ja.vim
let plugin_scrnmode_disable     = 1 " $VIM/plugins/kaoriya/scrnmode.vim
" let plugin_autodate_disable    = 1 " 日付を自動で挿入
" let plugin_verifyenc_disable   = 1 " fileencodingが正しいか検証する

" Plugin の管理 (vim-plug)
let g:plug_shallow = 0

if has('unix')
    call plug#begin('~/.vim/plugged')
elseif has('win32') || has('win64')
    call plug#begin('~/vimfiles/plugged')
endif

" Plug 'jlanzarotta/bufexplorer'
Plug 'mattn/vim-molder'
Plug 'tpope/vim-commentary' ", {'on': [] }
Plug 'itchyny/vim-parenmatch'
Plug 'juro106/ftjpn'
call plug#end()

" Load Event
augroup load_us_hold
    autocmd!
    autocmd CursorHold * call plug#load(
                \ 'vim-parenmatch',
                \ 'vim-commentary',
                \ )| autocmd! load_us_hold
augroup END
" ---------------------------------------------------------------------
" 基本的な設定 config setting
" ---------------------------------------------------------------------
language C                      " mode などの表記を英語にする
set noruler                     " 番号を表示しない
set notitle                     " タイトルを表示しない
set guicursor=a:blinkon0        " カーソルを点滅させない
set cmdheight=1                 " コマンドラインの高さ                    
set cmdwinheight=20             " コマンドラインウインドウの高さ                    
set laststatus=1                " ステータスラインはwindow分割時のみ表示                    
set foldmethod=syntax
" set foldcolumn=1                " 左に余白
set foldlevel=100               " 折りたたみはマニュアル（基本的に使わないため）
set ambiwidth=double            " □や○文字が崩れる問題を解決（マルチバイトは全角で）
set iminsert=0                  " 最初はIMEOFFで(英語)スタート
set imsearch=-1                 " 日本語で検索…しない 
set noswapfile                  " スワップファイルを作成しない
set noundofile                  " undofileファイルを作成しない
set nobackup                    " バックアップを作成しない
set vb t_vb=                    " エラーを画面点滅をさせない
set noerrorbells                " エラーの音を鳴らさない
set shortmess+=I                " 最初の画面を非表示
set shortmess-=S                " 検索結果のマッチした数を表示する
set ttyfast                     " ターミナル接続の高速化
set whichwrap+=<,>,[,],b,s  " 行間をでシームレスに移動する
set backspace =indent,eol,start " バックスペースで何でも消去する
set clipboard=unnamedplus       " 無名レジスタに入るデータを*レジスタにも入れる。
set display=lastline            " 出来る限りたくさん表示
set pumheight=10                " 補完メニューの高さ
set matchtime=1                 " 対応するカッコへ飛ぶまでの時間
set hlsearch                    " ハイライトサーチ
set incsearch                   " 検索しながらハイライト
set ignorecase                  " 検索時に大文字小文字を無視
set smartcase                   " 検索時に大文字を含む場合は区別する
set hidden                      " 保存なしで別のバッファへ
set synmaxcol=320               " syntaxhighlightの制限
set helplang=ja                 " ヘルプの日本語化
set notimeout                   " キーマップでタイムアウトしない
set ttimeout ttimeoutlen=10     " キーコードのタイムアウトの設定
set mouse=a
set imstyle=1                   " imstyle over-the-spotは1  効かない？
set showcmd                     " Visual mode の選択行の行数はこれで表示される
set path+=**                    " find で検索する範囲をサブディレクトリまで広げる
set wildmenu

" 改行コード
" ---------------------------------------------------------------------
set fileformat=unix
set fileformats=unix,dos,mac
function! s:set_fileformat()
    try
        setlocal fileformat=unix
    catch
    endtry
endfunction
autocmd BufRead * :call <SID>set_fileformat()

" 対応するカッコ
set matchpairs+=（:）,「:」,『:』,【:】,<:> 

" tab & indent
" ---------------------------------------------------------------------
"set list                      " Tabの可視化
set nolist
set expandtab                   " タブをスペースに変換する
set tabstop=4                   " タブを挿入するときの幅（見た目上の空白）
set smarttab                    " スペースの数がtabstopの値に達したらタブに変わる
set softtabstop=4               " vimが挿入するインデントの幅（見た目上の空白）
set shiftwidth=4                " 自動インデントでずれる幅
set autoindent                  " 普通の自動インデント（前の行を引き継ぐ）
set smartindent                 " ちょっと賢い自動インデント
" set cindent                     " 賢い自動インデント    
" vim script の 行連結に使う \(バックスラッシュ) のインデント
let g:vim_indent_cont = shiftwidth() * 1

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.c,*.cpp,*.css,*.yml,*.yaml,*.md,*.js,*.ts,*.jsx,*.tsx,*.json,*.tf setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.hs   setlocal sw=8 sts=8 ts=8 et
    autocmd FileType sh               setlocal sw=2 sts=2 ts=2 et
augroup End

" ---------------------------------------------------------------------
" filetype 
" ---------------------------------------------------------------------
augroup filetypeSetting
    autocmd!
    autocmd BufNewFile,BufRead *.go nnoremap <F12> :<C-u>! go run %:p<CR>
    autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.ts nnoremap <F12> :<C-u>call <SID>RUN('!tsc')<CR>

    " マークダウンのファイル名 .mdも含める
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*,md.draft,txt} set filetype=markdown
    autocmd BufNewFile,BufRead *.CASL2 set fenc=cp932 ff=dos " casl2用
augroup  END

function! s:RUN(lang) abort
    :tcd %:h
    exec a:lang shellescape(@%, 1)
endfunction

" shfmt
" function! _Doshfmt()
"     exe ":silent !shfmt -w -i 2 -ci -bn -s %"
"     exe ":e!"
" endfunction

" command! Doshfmt call _Doshfmt()

" augroup auto_shfmt
"     autocmd!
"     autocmd BufWritePost FileType sh :Doshfmt
"     autocmd BufWritePost *.sh :Doshfmt
" augroup End
" -----------------------------------------------------------
" buffer バッファ操作
" -----------------------------------------------------------
nnoremap <Space>b :ls<CR>:<C-u>b 
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [<C-b> :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> ]<C-b> :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> <Leader>b <C-^>
nnoremap <silent> <C-Tab> <C-^>
" -----------------------------------------------------------
" Vimgrep & Quickfix
" -----------------------------------------------------------
nnoremap <silent> [q :<C-u>cprevious<CR>
nnoremap <silent> [<C-q> :<C-u>cprevious<CR>
nnoremap <silent> ]q :<C-u>cnext<CR>
nnoremap <silent> ]<C-q> :<C-u>cnext<CR>
nnoremap <silent> [Q :<C-u>cfirst<CR>
nnoremap <silent> ]Q :<C-u>clast<CR>

augroup QuickFixCmd
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" ----------------------------------------------------------
" 色 color カーソル & Color Scheme
" -----------------------------------------------------------
" colorscheme
colorscheme mycolor

" syntax on
syntax off
set background=dark             " darkmode

" カーソルの形や色
" let &t_SI = "\e[6 q" "SI = INSERT mode
let &t_SI = "\e[2 q" "SI = INSERT mode
let &t_EI = "\e[2 q" "EI = NORMAL mode
let &t_SR = "\e[4 q" "SR = REPLACE mode

" ----------------------------------------------------------
" #normalMode ノーマルモードのキーマップ
" ----------------------------------------------------------
" file open ファイルの呼び出しなど
nnoremap [config] <Nop>
nmap <Space>j [config]

nnoremap <Space>f :find 

" _vimrcの呼び出し&読み込み
nnoremap <silent> <Space>re :<C-u>e $MYVIMRC<CR>
"nnoremap <silent> <Space>v :<C-u>so $MYVIMRC<CR>
" " _gvimrcの呼び出し&読み込み
" nnoremap <silent> [config]g :<C-u>e $MYGVIMRC<CR>
" nnoremap <silent> ,z :<C-u>so $MYGVIMRC<CR>

augroup source_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC 
    " autocmd BufWritePost $MYGVIMRC source $MYGVIMRC
augroup END

if has('unix')
    " colorscheme の呼び出し
    nnoremap <silent> [config]cl :<C-u>e ~/.vim/colors/mycolor.vim<CR>
    " syntax check の呼び出し
    nnoremap <silent> [config]si :<C-u>SyntaxInfo<CR>
endif

" カーソル操作、コマンド関連
noremap <silent> n nzz
noremap <silent> N Nzz
noremap <silent> g* g*zz
noremap <silent> g# g#zz

" 「 K(shift k) 」でカーソル下の単語のhelpを引く
set keywordprg=:help " Open Vim internal help by K command

" 置換 chikan change substitute
nnoremap <Space>s :<C-u>%s///g<Left><Left>
vnoremap <Space>s :s///g<Left><Left>

" Y は $Y へ変更
nnoremap <silent> Y y$

" 全選択
nnoremap g<C-a> ggVG 
" ハイライトを消す
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" 便利関係
" ----------------------------------------------------------
" 現在時刻の挿入 current time
nnoremap <Space>now a<C-R>=strftime("%Y-%m-%dT%H:%M:%S+09:00")<CR><Esc>
inoremap <C-y><C-t> <C-R>=strftime("%Y-%m-%dT%H:%M:%S+09:00")<CR>

" テンプレート挿入
nnoremap <Space>t :<C-u>-1read ~/.vim/template/

nnoremap <Space>w :w<CR>

" シェルコマンド shell command
nnoremap <Space><CR> V:!sh<CR>
vnoremap <Space><CR> :!sh<CR>

" toggle status line ステータスラインのトグル
nnoremap <silent> <F10> :set laststatus=<C-R>=(&laststatus==2?0:2)<CR><CR>
  
vnoremap <silent> gp s（<C-r>"）<Esc><Right>
vnoremap <silent> gk s「<C-r>"」<Esc><Right>
vnoremap <silent> gw s『<C-r>"』<Esc><Right>
vnoremap <silent> gs s【<C-r>"】<Esc><Right>

" ----------------------------------------------------------
" #insertMode インサートモード（挿入モード）のキーマップ
" ----------------------------------------------------------
" Ctrl-Space, Alt-Space
imap <Nul> <C-Space>
inoremap <C-Space> <Nop>
inoremap <A-Space> <Nop>

inoremap <silent> <C-l> <Esc>ciw<<C-r>"></<C-r>"><Esc>cit

" ----------------------------------------------------------
" #visualMode ビジュアルモードのkeymap
" ----------------------------------------------------------

" ヤンクやペーストの後に行の末尾へ移動させるパターン
vnoremap <silent> <Space>y y`]
nnoremap <silent> <Space>y y`]
vnoremap <silent> <Space>p p`]
nnoremap <silent> <Space>p p`]

" ----------------------------------------------------------
" #commandlinemode コマンドラインモード
" ----------------------------------------------------------
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" cnoremap <expr> <C-x> getcmdtype() == ':' ? expand('%:p') : '%%'
" cnoremap <C-o>w !sudo tee > /dev/null %

" ==========================================================
" Plugins
" ==========================================================
" ----------------------------------------------------------
" Molder
" ----------------------------------------------------------
let g:molder_show_hidden = 1
nnoremap <silent> <Space>e :e .<CR>
function! s:custom_molder_mappings() abort
    nnoremap <buffer> l <Plug>(molder-open)
    nnoremap <buffer> h <Plug>(molder-up)
    nnoremap <buffer> q :<C-u>bw<CR>
endfunction

augroup vimrc_molder
    autocmd!
    autocmd FileType molder call s:custom_molder_mappings()
augroup END
" ----------------------------------------------------------
" Bufexplorer
" ----------------------------------------------------------
" nnoremap <Space>b :<C-u>BufExplorer<CR>
" デフォルトキーマップを使用しない
" let g:bufExplorerDisableDefaultKeyMapping=1  " Disable mapping.
" let g:bufExplorerShowRelativePath=1          " Show relative paths.
" let g:bufExplorerDefaultHelp = 0             " Do not show default help.
" let g:bufExplorerSplitBelow=1                " Split new window below current.

" ----------------------------------------------------------
" ParentMatch
" ----------------------------------------------------------
" matchparenはオフにする
let g:loaded_matchparen = 1

" highlightはmatchparen仕様で
let g:parenmatch_highlight = 0
highlight link ParenMatch MatchParen

" -------------------------------------------------------------------------------
" ftjpn 
" -------------------------------------------------------------------------------
" 記号を複数指定した場合、同じ文字を連続して検索することにならない限り繰り返しは不可

let g:ftjpn_key_list = [
    \ ['.', '。', '．'],
    \ [',', '、', '，'],
    \ ['!', '！'],
    \ ['?', '？'],
    \ ['(', '（', '）'],
    \ [')', '）'],
    \ ['[', '「', '」'],
    \ [']', '」'],
    \ ['g', 'が'],
    \ ['t', 'て'],
    \ ['i', 'に'],
    \ ['w', 'を'],
    \ ['h', 'は'],
    \ ['n', 'の'],
    \ ['d', 'で'],
    \ ['u', 'く'],
    \ ['k', 'か'],
    \ ['a', 'な'],
    \ ['r', 'る'],
    \ ['o', 'と'],
    \ ['y', 'よ'],
    \ ]


" --------------------------------------------------------------------------------
" 自作関数など
" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" syntaxhighlightを調べる関数
" --------------------------------------------------------------------------------
function! s:get_syn_id(transparent)
    let synid = synID(line("."), col("."), 1)
    if a:transparent
        return synIDtrans(synid)
    else
        return synid
    endif
endfunction
function! s:get_syn_attr(synid)
    let name = synIDattr(a:synid, "name")
    let ctermfg = synIDattr(a:synid, "fg", "cterm")
    let ctermbg = synIDattr(a:synid, "bg", "cterm")
    let guifg = synIDattr(a:synid, "fg", "gui")
    let guibg = synIDattr(a:synid, "bg", "gui")
    return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
    let baseSyn = s:get_syn_attr(s:get_syn_id(0))
    echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
    let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
    echo "link to"
    echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" ---------------------------------------------------------------------------
" linux用 日本語固定モード
" ---------------------------------------------------------------------------
nnoremap <silent> <F2> :<C-u>call <SID>ImeModeChange(current_ime)<CR>
inoremap <silent> <F2> <C-o>:<C-u>call <SID>ImeModeChange(current_ime)<CR>
" normal で IME もオフにする
nnoremap <silent> <Esc> :<C-u>OffIME<CR><ESC>
command! OffIME :call <SID>OffIME()
let g:current_ime = 0
function! s:ImeModeChange(arg)
    if g:current_ime == 0
        let g:current_ime = 1
    else
        let g:current_ime = 0  
    endif
    echo 'Japanese Fixed Mode: ' . a:arg
endfunction

function! s:ImeControl(active)
    if a:active == 1
        call system('fcitx5-remote -s mozc')
    else
        call system('fcitx5-remote -c mozc')
    endif
endfunction

" IME をオフ
function! s:OffIME() abort
    call system('fcitx5-remote -c')
endfunction

augroup Ime
    autocmd!
    autocmd InsertEnter * call <SID>ImeControl(current_ime)
    autocmd InsertLeave,CmdlineEnter,CmdlineLeave,CmdwinEnter,CmdwinLeave * call <SID>OffIME()
augroup END

" terminal
command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

