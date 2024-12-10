set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
" set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
"set shellslash
set guioptions+=M               " $VIMRUTIME/menu.vimを読み込まない
set guioptions+=k               " タブなどの追加時にウインドウサイズ等を維持
set guioptions-=e               " Gvim でもテキストベースのタブを使う
set langmenu=none

set background=dark             " darkmode
syntax enable
filetype plugin indent on
syntax off

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

" Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-expand-region'
Plug 'majutsushi/tagbar'
Plug 'kana/vim-textobj-user'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'
Plug 'deton/jasegment.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cocopon/vaffle.vim'
Plug 'tomtom/tcomment_vim' ", {'on': [] }
" Plug 'fuenor/im_control.vim' ", {'on': [] }
Plug 'itchyny/vim-parenmatch' ", {'on': [] }
Plug 'itchyny/vim-haskell-indent', {'on': [] }
Plug 'jason0x43/vim-js-indent', { 'for': 'typescript' }
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
" Plug 'juro106/mkz'
Plug 'jlanzarotta/bufexplorer'
Plug 'tyru/open-browser.vim' ", {'on': []}

" lsp >>>
Plug 'prabirshrestha/vim-lsp' ", { 'on': [] }
Plug 'mattn/vim-lsp-settings' ", {'on': []}
Plug 'mattn/vim-lsp-icons'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/vim-goimports' ", {'on': []}
Plug 'elmcast/elm-vim' ", {'on': []}
" Plug '~/.fzf'
" Plug 'junegunn/fzf.vim'
Plug 'juro106/ftjpn'
" Plug 'machakann/vim-sandwich'
" Plug 'rhysd/clever-f.vim'
" Plug 'mattn/wiseman-f-vim'
" Plug 'osyo-manga/vim-textobj-multitextobj'
" Plug 'kana/vim-textobj-jabraces'
" Plug 'deton/jasentence.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

function! s:load_plug(timer)
	call plug#load(
		\ 'vim-lsp',
		\ 'vim-lsp-settings',
		\ )
endfunction
call timer_start(500, function("s:load_plug"))


"load Event
" augroup load_us_insert
"     autocmd!
"     autocmd InsertEnter * call plug#load(
"         \ 'im_control.vim',
"         \ ) | autocmd! load_us_insert
" augroup END

augroup load_us_hold
    autocmd!
    autocmd CursorHold * call plug#load(
        \ 'tcomment_vim',
        \ 'vim-parenmatch',
        \ ) | autocmd! load_us_hold
augroup END

" migemo
if has("migemo")
    set migemo
    set migemodict=~/vimfiles/dict/utf-8/migemo-dict
endif
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

" ---------------------------------------------------------------------
" lsp
" ---------------------------------------------------------------------
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_verbose = 1
" let g:asyncomplete_auto_popup = 0
" let g:asyncomplete_auto_completeopt = 1
" let g:asyncomplete_popup_delay = 100
let g:lsp_text_edit_enabled = 1
let g:goimports = 1

function! s:on_lsp_buffer_enabled() abort
  " setlocal omnifunc=lsp#complete
  setlocal signcolumn=no " left margin
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover)
  " inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
  au!
  autocmd BufWritePre <buffer> :silent LspDocumentDiagnostics
endfunction

" ?
" augroup diagnostics
" augroup End

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/vim-lsp.log')

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp'],
        \ })
endif

if executable('haskell-language-server-wrapper')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'haskell-language-server-wrapper',
        \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git'],
        \     ))},
        \ 'whitelist': ['haskell', 'lhaskell'],
        \ })
endif
let g:elm_format_autosave = 1

nnoremap <Space>== :<C-u>LspDocumentFormat<CR>

" shfmt
function! _Doshfmt()
    exe ":silent !shfmt -w -i 2 -ci -bn -s %"
    exe ":e!"
endfunction

command! Doshfmt call _Doshfmt()

augroup auto_shfmt
    autocmd!
    autocmd BufWritePost FileType sh :Doshfmt
    autocmd BufWritePost *.sh :Doshfmt
augroup End

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
set whichwrap+=h,l,<,>,[,],b,s  " 行間をでシームレスに移動する
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
" set showcmd

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

" set verbosefile=~/log/vim.log
" set verbose=20

" 対応するカッコ
set matchpairs+=（:）,「:」,『:』,【:】,<:> 

" % で対応するカッコにジャンプ
source $VIMRUNTIME/macros/matchit.vim
let b:match_words='<\if\>:<\endif\>:<\else if\>, <div.*>:</div>'

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
    autocmd BufNewFile,BufRead *.c    setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.cpp  setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.css  setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.yml  setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.yaml setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.md   setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.js   setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.ts   setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.jsx  setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.tsx  setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.json setlocal sw=2 sts=2 ts=2 et
    autocmd BufNewFile,BufRead *.hs   setlocal sw=8 sts=8 ts=8 et
    autocmd BufNewFile,BufRead *.tf   setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sh setlocal sw=2 sts=2 ts=2 et
augroup End

" ---------------------------------------------------------------------
" filetype 
" ---------------------------------------------------------------------

" ,e でScript実行。 filetype ごとに
augroup filetypeSetting
    autocmd!
    autocmd BufNewFile,BufRead *.py setfiletype python
    autocmd BufNewFile,BufRead *.rb setfiletype ruby
    autocmd BufNewFile,BufRead *.ts setfiletype typescript
    autocmd BufNewFile,BufRead *.js setfiletype javascript
    autocmd BufNewFile,BufRead *.go nnoremap <F5> :<C-u>! go run %:p<CR>
    autocmd BufNewFile,BufRead *.py nnoremap ,e :<C-u>!python3 %<CR>
    autocmd BufNewFile,BufRead *.py nnoremap <F12> :<C-u>call <SID>RUN('!python3')<CR>
    autocmd BufNewFile,BufRead *.rb nnoremap ,e :<C-u>!ruby %<CR>
    autocmd BufNewFile,BufRead *.rb nnoremap <F12> :<C-u>call <SID>RUN('!ruby')<CR>
    autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.ts nnoremap ,e :<C-u>!tsc %<CR>
    autocmd BufNewFile,BufRead *.ts nnoremap <F12> :<C-u>call <SID>RUN('!tsc')<CR>

    " マークダウンのファイル名 .mdも含める
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*,md.draft,txt} set filetype=markdown
    " markdown 目次表示
    autocmd BufNewFile,BufRead *.md nnoremap <Leader>toc :Toc<CR>
    autocmd BufNewFile,BufRead *.md set scl=no " 左側の余白
    autocmd BufNewFile,BufRead *.CASL2 set fenc=cp932 ff=dos " casl2用
augroup  END

function! s:RUN(lang) abort
    :tcd %:h
    :exec a:lang shellescape(@%, 1)
endfunction

" -----------------------------------------------------------
" buffer バッファ操作
" -----------------------------------------------------------
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

" -----------------------------------------------------------
" file ファイル操作
" -----------------------------------------------------------
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
cnoremap <expr> <C-x> getcmdtype() == ':' ? expand('%:p') : '%%'
cnoremap <C-o>w !sudo tee > /dev/null %

" -----------------------------------------------------------
" 色 color
" -----------------------------------------------------------
" colorscheme
colorscheme mycolor
" colorscheme iceberg

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

" _vimrcの呼び出し&読み込み
nnoremap <silent> ,. :<C-u>e $MYVIMRC<CR>
nnoremap <silent> ,v :<C-u>so $MYVIMRC<CR>
" _gvimrcの呼び出し&読み込み
nnoremap <silent> [config]g :<C-u>e $MYGVIMRC<CR>
nnoremap <silent> ,z :<C-u>so $MYGVIMRC<CR>

augroup source_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC 
    autocmd BufWritePost $MYGVIMRC source $MYGVIMRC
augroup END

if has('unix')
    " colorscheme の呼び出し
    nnoremap <silent> [config]cl :<C-u>e ~/.vim/colors/mycolor.vim<CR>
    " syntax/python.vimの呼び出し
    nnoremap <silent> [config]pv :<C-u>e ~/.vim/after/syntax/python.vim<CR>
    " keymap ergodox keymap.c
    nnoremap <silent> [config]ergo :<C-u>e ~/.dotfileo/keyboards/ergodox_ez/keymaps/custom/keymap.c<CR>
    " i3 
    nnoremap <silent> [config]i3 :<C-u>e ~/.config/i3/config<CR>
    " xkeysnail
    nnoremap <silent> [config]xk :<C-u>e ~/.config/xkeysnail/config.py<CR>
    " syntax check の呼び出し
    nnoremap <silent> [config]ch :<C-u>SyntaxInfo<CR>
endif

" : ; の入れ替え
" nnoremap : ;
" nnoremap ; :
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

" カーソル操作、コマンド関連
noremap <silent> n nzz
noremap <silent> N Nzz
noremap <silent> * *zz
noremap <silent> # #zz
noremap <silent> g* g*zz
noremap <silent> g# g#zz

nnoremap <silent> ,, ,
nnoremap <silent> ,p ,

" 日本語固定モード
" let IM_CtrlMode = 6
" inoremap <silent> <F2> <C-^><C-r>=IMState('FixMode')<CR>
" set statusline+=%{IMStatus('[日本語固定モード]')}

" :helpを引く
nnoremap <Leader>h :<C-u>help<Space>
nnoremap <F1> :<C-u>help<Space>
" 「 K(shift k) 」でカーソル下の単語のhelpを引く
set keywordprg=:help " Open Vim internal help by K command

" 置換 chikan change substitute
nnoremap ,s :<C-u>%s///g<Left><Left>
vnoremap ,s :s///g<Left><Left>

" tab pageを使いやすくする
" ------------------------
" nnoremap ,t :<C-u>tabnew<CR>
" nnoremap <C-TAB> gt
" nnoremap <C-S-TAB> gT
nnoremap g<TAB> gT

" Y は $Y へ変更
nnoremap <silent> Y $y

" tagジャンプ
" nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>j :<C-u>tag<CR>
nnoremap <Leader>k :<C-u>pop<CR>
nnoremap <Leader>l :<C-u>tags<CR>

" カーソルの縦移動を表示行と論理行で逆に
" nnoremap j gj
" nnoremap k gk
" nnoremap gj j
" nnoremap gk k

" 全選択
nnoremap g<C-a> ggVG 
" 全コピー
nnoremap gay :<C-u>%y<CR>
" normal で IME もオフにする
nnoremap <silent> <Esc><Esc> :<C-u>OffIME<CR>
nnoremap <silent> <C-\><C-\> :<C-u>OffIME<CR>
command! OffIME :call <SID>OffIME()
" ハイライトを消す
"nnoremap <silent> <Esc><Esc> :<C-u>noh<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" ２行挿入
nnoremap <Space>o o<Esc>o

" Delete_Surround_HTML_Tag タグを除去
nnoremap <silent> dst "0yitdat"0P
" xnoremap <silent> dst <Esc>"0yitdat"0P
"
" nnoremap <silent> dsp "0yib"0P
" xnoremap <silent> dsp <Esc>"0yib"0P
"
" nnoremap <silent> dsb "0yibdab"0P
" xnoremap <silent> dsb <Esc>"0yibdab"0P
"
" nnoremap <silent> ds" "0yi"da""0P
" xnoremap <silent> ds" <Esc>"0yi"da""0P
"
" nnoremap <silent> ds' "0yi'da'"0P
" xnoremap <silent> ds' <Esc>"0yi'da'"0P

" 1行ごとに空行を入れる
nnoremap <leader>al :%s/$/\r/gc<CR>
vnoremap <leader>al :s/$/\r/gc<CR>
" 空行を削除
nnoremap <leader>dl :%s/^$\n//gc<CR>
vnoremap <leader>dl :s/^$\n//gc<CR>
" 行内のスペースをカット
nnoremap <leader>dsp :%s/\s\+//gc<CR>
vnoremap <leader>dsp :s/\s\+//gc<CR>
" 特定の単語を含む行を収集する
nnoremap <leader>c :<C-u>g//yank Q<Home><Right><Right>

" 現在時刻の挿入 current time
nnoremap ,ct a<C-R>=strftime("%Y-%m-%dT%H:%M:%S+09:00")<CR><Esc>

" Space key 関係
" ----------------------------------------------------------
nnoremap <Space>a A
nnoremap <Space>i I
nnoremap <Space>v _v$h
vnoremap <Space>v <Esc>_v$h
nnoremap <Space>w :w<CR>
nnoremap <Space>y  y$

" シェルコマンド shell command
nnoremap <Space><CR> V:!sh<CR>
vnoremap <Space><CR> :!sh<CR>
" 行を丸ごと上下移動
" nnoremap <C-k> "zdd<Up>"zP
" nnoremap <C-j> "zdd"zp
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
" 複数行を丸ごと移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]
" ----------------------------------------------------------
" #insertMode インサートモード（挿入モード）のキーマップ
" ----------------------------------------------------------
" jj で Esc
" inoremap jj <Esc>
inoremap っj <Esc>

" CTRL-C,J は Esc
inoremap <C-j> <Esc>

" CTRL-Space
imap <Nul> <C-Space>
inoremap <C-Space> <Nop>

" CtrlとLで ESC して 右
inoremap <C-l> <Esc><Right>

" オムニ補完
" inoremap <F7> <C-x><C-o>

" snippet挿入 ※文字を入力してから C-z で snippet が挿入される
inoremap <C-z> <Esc>:<C-u>call MySnippet()<CR>

" 全角の括弧を補完
" inoremap {<CR> {<CR>}<Esc>ko
inoremap ¨（ （）<Esc>i
inoremap ¨「 「」<Esc>i
inoremap ¨『 『』<Esc>i
inoremap ¨【 【】<Esc>i

" 直前の１単語削除
inoremap <silent> <C-BS> <C-g>u<C-w>
" 行頭まで削除
inoremap <silent> <C-u> <C-g>u<C-u>
" 「。」でアンドゥ設定（一旦区切りになる）
inoremap <silent> 。 。<C-g>u
" 「、」でアンドゥ設定（一旦区切りになる）
inoremap <silent> 、 、<C-g>u
" 単語単位の移動
inoremap <silent> <C-b> <S-Left>
" ダイグラフ
inoremap <silent> <M-v> <C-K>
" ----------------------------------------------------------
" #visualMode ビジュアルモードのkeymap
" ----------------------------------------------------------

" vで範囲を拡大。<C-v>で範囲を縮小
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ヤンクやペーストの後は行の末尾へ移動
vnoremap <silent> <Space>y y`]
nnoremap <silent> <Space>y y`]
vnoremap <silent> <Space>p p`]
nnoremap <silent> <Space>p p`]

" vモードの置換連続ペースト用
" `>　選択した範囲の最後の文字列へ移動
" gv"_x 消去用レジスタを指定して文字削除
function! Put_text_without_override_register()
    let line_len = strlen(getline('.'))
    execute "normal! `>"
    let col_loc = col('.')
    execute 'normal! gv"_x'
    if line_len == col_loc
        execute 'normal! p`]'
    else 
        execute 'normal! P`]'
    endif
endfunction
xnoremap <silent> p :<C-u>call Put_text_without_override_register()<CR>

" ----------------------------------------------------------
" #commandlinemode コマンドラインモード
" ----------------------------------------------------------
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
" 日付
cnoremap <expr> ,d strftime('%Y-%m-%d')

if has('win32') || has('win64')
    " terminal で WSLを呼び出す 
    cnoremap <C-t> <C-u>terminal ++close C:/WINDOWS/System32/bash.exe<CR>
endif

" ----------------------------------------------------------
" Leaderの活用（ \ がleader ）
" ----------------------------------------------------------
" サクッと保存
nnoremap <silent> ,w :<C-u>w<CR>
" サクッと終了
nnoremap <silent> ,q :<C-u>q<CR>
" カーソル下の単語をハイライトする
nnoremap <silent> <F3> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
" カーソル下の単語を置換する
nmap <F8> <F3>;%s/<C-r>///gc<left><Left><Left>
" 現在の選択範囲を検索する
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" -----------------------------------------------------------------------------------------
" plugins setting プラグイン関係
" -----------------------------------------------------------------------------------------
" ----------------------------------------------------------
" Ctrlp
" ----------------------------------------------------------
" 検索不要な対象 nodemodule
let g:ctrlp_custom_ignore = 'node_modules\|git'

" ----------------------------------------------------------
" Bufexplorer
" ----------------------------------------------------------
nnoremap <Space>b :<C-u>BufExplorer<CR>
" デフォルトキーマップを使用しない
let g:bufExplorerDisableDefaultKeyMapping=1  " Disable mapping.
let g:bufExplorerShowRelativePath=1          " Show relative paths.
let g:bufExplorerDefaultHelp = 0             " Do not show default help.
let g:bufExplorerSplitBelow=1                " Split new window below current.

" ----------------------------------------------------------
" ParentMatch
" ----------------------------------------------------------
" matchparenはオフにする
let g:loaded_matchparen = 1

" highlightはmatchparen仕様で
let g:parenmatch_highlight = 0
highlight link ParenMatch MatchParen

"- ---------------------------------------------------------
" clever-f
" ----------------------------------------------------------
" let g:clever_f_not_overwirtes_standard_mappings = 1
let g:clever_f_smart_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
" let g:clever_f_chars_match_any_signs = ';'
"nmap : <Plug>(clever-f-repeat-forward)
"nmap ,, <Plug>(clever-f-repeat-back)
" ----------------------------------------------------------
" vim-js-indent
" ----------------------------------------------------------
let g:js_indent_typescript = 1 

" ----------------------------------------------------------
" vim-sonictemplate
" ----------------------------------------------------------
" template の 配置ディレクトリ
let g:sonictemplate_vim_template_dir = expand('~/vimfiles/template')

" ----------------------------------------------------------
" fzf.vim
" ----------------------------------------------------------
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
" nnoremap ,r :<C-u>Rg 
" nnoremap <silent> ,b :<C-u>Buffers<CR>
" nnoremap <silent> <leader><leader> :<C-u>Buffers<CR>
" nnoremap <silent> <leader>n :bnext<CR>
" nnoremap <silent> <leader>h :bprev<CR>
" nnoremap <silent> <leader>f :<C-u>Files<CR>
" nnoremap <silent> <leader>g :<C-u>GFiles?<CR>
"
" command! -bang -nargs=* Rg
"     \ call fzf#vim#grep(
"     \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"     \   <bang>0 ? fzf#vim#with_preview('up:60%')
"     \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"     \   <bang>0)
" if has('win32') || has('win64')
"     command! -bang -nargs=* Rg
"         \ call fzf#vim#grep(
"         \   'rg --column --line-number --no-heading --color=always --smart-case "'.<q-args>.'"', 1,
" endif
"
" ----------------------------------------------------------
" Vaffle
" ----------------------------------------------------------
let g:vaffle_open_selected_vsplit_position = 'rightbelow'
let g:vaffle_open_selected_split_position = 'rightbelow'
let g:vaffle_show_hidden_files = 1

nnoremap <silent> <Space>f :Vaffle<CR>

function! s:customize_vaffle_mappings() abort
    nmap <buffer> C <Plug>(vaffle-chdir-here)
    nmap <buffer> ,root <Plug>(vaffle-open-root)
    " delete-selected
    nmap <buffer> d <Nop> 
    nmap <buffer> D <Plug>(vaffle-delete-selected) 
    " new-file
    nmap <buffer> i <Nop> 
    nmap <buffer> ,touch <Plug>(vaffle-new-file)
    " mkdir
    nmap <buffer> ,mkdir <Plug>(vaffle-mkdir)
    " open-parent
    nmap <buffer> - <Plug>(vaffle-open-parent)
    " open
    nmap <buffer> o <Plug>(vaffle-open-selected-split)
    nmap <buffer> v <Plug>(vaffle-open-selected-vsplit)
endfunction

augroup vimrc_vaffle
    autocmd!
    autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END

" ----------------------------------------------------------------------------------
" textobj_multblock
" ----------------------------------------------------------------------------------
let g:textobj_multiblock_blocks = [
     \      [ '`', '`', 1],
     \      [ '（', '）' ],
     \      [ '「', '」' ],
     \      [ '『', '』' ],
     \      [ '【', '】' ],
     \ ]

omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

" ----------------------------------------------------------------------------------
" vim-operator-surround
" ----------------------------------------------------------------------------------
nmap <silent> <Space>s <Plug>(operator-surround-append)
nmap <silent> <Space>d <Plug>(operator-surround-delete)
nmap <silent> <Space>c <Plug>(operator-surround-replace)
vmap <silent> <Space>s <Plug>(operator-surround-append)
vmap <silent> <Space>d <Plug>(operator-surround-delete)
vmap <silent> <Space>c <Plug>(operator-surround-replace)

nmap <silent> <Space>dd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
nmap <silent> <Space>cc <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

let g:operator#surround#blocks = {
    \ '-' : [
    \   { 'block' : [' ', ' '], 'motionwise' : ['char', 'line', 'block'], 'keys' : [' '] },
    \   { 'block' : ["'", "'"], 'motionwise' : ['char', 'line', 'block'], 'keys' : ["'"] },
    \   { 'block' : ['"', '"'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['"'] },
    \   { 'block' : ['`', '`'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['`'] },
    \   { 'block' : ['(', ')'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['('] },
    \   { 'block' : ['( ', ' )'], 'motionwise' : ['char', 'line', 'block'], 'keys' : [')'] },
    \   { 'block' : ['（', '）'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['c'] },
    \   { 'block' : ['「', '」'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['k'] },
    \   { 'block' : ['『', '』'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['K'] },
    \   { 'block' : ['< ', ' >'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['>'] },
    \   { 'block' : ['＜', '＞'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['v'] },
    \   { 'block' : ['〈', '〉'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['y'] },
    \   { 'block' : ['[', ']'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['['] },
    \   { 'block' : ['[ ', ' ]'], 'motionwise' : ['char', 'line', 'block'], 'keys' : [']'] },
    \   { 'block' : ['{', '}'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['{'] },
    \   { 'block' : ['{ ', ' }'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['}'] },
    \   { 'block' : ['{{ ', ' }}'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['w'] },
    \   { 'block' : ['【', '】'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['sm'] },
    \   { 'block' : ['“', '”'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['dq'] },
    \   { 'block' : ['<% ', ' %>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['%'] },
    \   { 'block' : ['<p>', '</p>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['p'] },
    \   { 'block' : ['<strong>', '</strong>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['st'] },
    \   { 'block' : ['<b>', '</b>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['b'] },
    \   { 'block' : ['<em>', '</em>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['e'] },
    \   { 'block' : ['<h1>', '</h1>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['1'] },
    \   { 'block' : ['<h2>', '</h2>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['2'] },
    \   { 'block' : ['<h3>', '</h3>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['3'] },
    \   { 'block' : ['<h3 class="minimum">', '</h3>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['mini'] },
    \   { 'block' : ['<h4>', '</h4>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['4'] },
    \   { 'block' : ['<h5>', '</h5>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['5'] },
    \   { 'block' : ['<h6>', '</h6>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['6'] },
    \   { 'block' : ['<ul>', '</ul>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['u'] },
    \   { 'block' : ['<ol>', '</ol>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['o'] },
    \   { 'block' : ['<li>', '</li>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['l'] },
    \   { 'block' : ['<div class="">', '</div>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['div'] },
    \   { 'block' : ['<span class="red">', '</span>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['red'] },
    \   { 'block' : ['<tr>', '</tr>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['tr'] },
    \   { 'block' : ['<td>', '</td>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['td'] },
    \   { 'block' : ['<th>', '</th>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['th'] },
    \   { 'block' : ['<table>', '</table>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['table'] },
    \   { 'block' : ['<a href="#">', '</a>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['h'] },
    \   { 'block' : ['<div class="nmlbox graybg">', '</div>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['gb'] },
    \   { 'block' : ['<div class="nmlbox">', '</div>'], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['nm'] },
    \ ],
    \ }

" --------------------------------------------------------------------------------
" jasegment.vim（日本語の単語単位WBE移動）
" --------------------------------------------------------------------------------

" emmet-vim
" --------------------------------------------------------------------------------
let g:user_emmet_leader_key = '<C-y>'
imap <C-k> <C-y>,
vmap <C-k> <C-y>,

" マクロの登録。囲みたい範囲をVモードで選択してから、emmet-vimで囲む。
" インサートモードで文字を打ってからEsc, その後<C-y>, でタグを展開する。
" htmlタグで囲むショートカット
vnoremap <silent> ,l @l
vnoremap <silent> ,o @o

" tagbarの呼び出し
" --------------------------------------------------------------------------------
nnoremap <silent> <F11> :TagbarToggle<CR>

" --------------------------------------------------------------------------------
" Mkzの呼び出し
" --------------------------------------------------------------------------------
"
"  windowの幅 (default 60)
" let l:mkz_width=60
" windowを開く位置( default -> 0(right), left -> 1 ) 
" let l:mkz_open_left=0
" windowを開いた後のカーソル( default -> 0(そのまま), new window -> 1 )
" let l:mkz_focus=0

"nmap <silent> <Leader>t <Plug>(mkz-toggle)

" -------------------------------------------------------------------------------------------------------------------
" ftjpn 
" -------------------------------------------------------------------------------------------------------------------

" nmap <silent> <Space>f F
" nmap <silent> <Space>t T

let g:ftjpn_key_list = [
    \ ['.', '。', '．'],
    \ [',', '、', '，'],
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
    \ ['c', '（', '）'],
    \ ['q', '」', '』', '】'],
    \ ['(', '（', '）'],
    \ [')', '）'],
    \ ['[', '「', '」'],
    \ [']', '」'],
    \ ['!', '！'],
    \ ['?', '？'],
    \ ]
" 記号を複数指定した場合、同じ文字を検索しない限り繰り返しは不可
" ※行を跨ぐ検索のほうが便利そうだと思ったけど、それだと複数候補のどれが引っ掛るか不明瞭なのでやはり行限定で良しとすることにした。

" -------------------------------------------------------------------------------------------------------------
" 自作関数など
" -------------------------------------------------------------------------------------------------------------
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

" タグで囲む
function! s:MySurround(tag) abort
    exec "normal! _d$"
    exec "normal! i" . a:tag
    exec "normal! ditP"
endfunction

nnoremap <silent> mp :<C-u>call <SID>MySurround('<p></p>')<CR>
nnoremap <silent> m1 :<C-u>call <SID>MySurround('<h1></h1>')<CR>
nnoremap <silent> m2 :<C-u>call <SID>MySurround('<h2></h2>')<CR>
nnoremap <silent> m3 :<C-u>call <SID>MySurround('<h3></h3>')<CR>
nnoremap <silent> m4 :<C-u>call <SID>MySurround('<h4></h4>')<CR>
nnoremap <silent> m5 :<C-u>call <SID>MySurround('<h5></h5>')<CR>

" surround.vimの代替
nnoremap <silent> \s( ciw(<C-r><C-o>")<Esc>
nnoremap <silent> m1 ^c$<h1><C-r><C-o>"</h1><Esc>
nnoremap <silent> m2 :normal I<h2><Esc>A</h2><Esc>
nnoremap <silent> m3 ^c$<h3><C-r><C-o>"</h3><Esc>
nnoremap <silent> m4 ^c$<h4><C-r><C-o>"</h4><Esc>
nnoremap <silent> m5 ^c$<h5><C-r><C-o>"</h5><Esc>
nnoremap <silent> mp ^c$<p><C-r><C-o>"</p><Esc>

" scrapbox
function! s:sbnew(prj)
    let prj = a:prj

    let input = input('This is @'.prj.': Other Project? [n]: ')
    if input != ""
      let prj = input
    endif

    let ans = input('Create? @'.prj.' (y/n) [n]: ')
    if ans != 'y'
      redraw
      echo 'Canceled!'
      return
    endif

    let datetime = strftime('%Y-%m-%d').'_'.strftime('%H:%M:%S')
    let url = 'https://scrapbox.io/'.prj.'/'.datetime
    " call append(0, url)

    execute ':OpenBrowser '.url
    execute ':%y'
endfunction

nnoremap <silent> <Leader><Leader>sp :<C-u>call <SID>sbnew('samemo')<CR>

" linux用 日本語固定モード
let g:current_ime = 0
function! s:ImeModeChange(arg)
    if g:current_ime == 0
        let g:current_ime = 1
        hi! Cursor guifg=NONE guibg=#d10000
    else
        let g:current_ime = 0  
        hi! CursorIM ctermbg=15 guifg=#f6f3e8 guibg=#ff99ff gui=none
    endif
    echo 'Japanese Fixed Mode: ' . g:current_ime
endfunction

nnoremap <silent> <F2> :<C-u>call <SID>ImeModeChange(current_ime)<CR>
inoremap <silent> <F2> <Esc>:<C-u>call <SID>ImeModeChange(current_ime)<CR>a

function! s:ImeControl(active)
  if a:active == 1
       call system('fcitx5-remote -s mozc')
   else
       call system('fcitx5-remote -c')
   endif
endfunction

" IME をオフ
function! s:OffIME() abort
   call system('fcitx5-remote -c')
endfunction

augroup Ime
   autocmd!
   autocmd InsertEnter * call <SID>ImeControl(current_ime)
   autocmd InsertLeave * call <SID>OffIME()
   autocmd CmdlineEnter * call <SID>OffIME()
   autocmd CmdlineLeave * call <SID>OffIME()
   autocmd CmdwinEnter * call <SID>OffIME()
   autocmd CmdwinLeave * call <SID>OffIME()
augroup END

command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

