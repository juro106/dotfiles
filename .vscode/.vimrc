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

" ----------------------------------------------------------
" #insertMode インサートモード（挿入モード）のキーマップ
" ----------------------------------------------------------
" jj で Esc
inoremap <silent> jj <Esc>
" alt + j は ahk によって imeoff + esc に設定されている
inoremap <C-j> <M-j>

" CTRL-C は Esc
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
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" ----------------------------------------------------------
" #commandlinemode コマンドラインモード
" ----------------------------------------------------------
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
