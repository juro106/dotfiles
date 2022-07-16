" ----------------------------------------------------------
"  VSCode 用の vimrc ~/.vscode/.vimrc
" ----------------------------------------------------------

" ----------------------------------------------------------
" #normalmode ノーマルモードのキーマップ
" ----------------------------------------------------------
" : ; の入れ替え
nnoremap : ;
nnoremap ; :

" 
nnoremap ,w :w<CR>
nnoremap ,q :q<CR>

" カーソル操作、コマンド関連
noremap <silent> n nzz
noremap <silent> N Nzz
noremap <silent> * *zz
noremap <silent> # #zz
noremap <silent> g* g*zz
noremap <silent> g# g#zz

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" 置換
nnoremap ch :<C-u>%s///g<Left><Left>
nnoremap ,s :<C-u>%s///g<Left><Left>
vnoremap ch :s///g<Left><Left>
vnoremap ,s :s///g<Left><Left>

" ----------------------------------------------------------
" #insertMode インサートモード（挿入モード）のキーマップ
" ----------------------------------------------------------
" jj で Esc
inoremap <silent> jj <Esc>
inoremap <silent> ｊｊ <Esc>

" CTRL-C, CTRL-J は Esc
inoremap <C-j> <Esc>
inoremap <C-c> <Esc>

" ２行挿入
inoremap <silent> <C-o><C-o> <C-g>u<Esc>o<CR>

" ----------------------------------------------------------
" #visual ビジュアルモードのkeymap
" ----------------------------------------------------------
" ; :
vnoremap ; :
vnoremap : ;

" ヤンクやペーストの後は行の末尾へ移動
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" ----------------------------------------------------------
" #commandlinemode コマンドラインモード
" ----------------------------------------------------------
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
