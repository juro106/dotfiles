scriptencoding utf-8

if exists('g:loaded_multi_f')
    finish
endif

let g:loaded_multi_f = 1

let s:save_cpo = &cpo
set cpo&vim

if !get(g:, 'multi_f_no_defalut_key_mappings', 0)
    let g:multi_f = 'f'
    let g:multi_F = 'F'
    let g:multi_t = 't'
    let g:multi_T = 'T'
endif

if !exists('g:multi_f_key_list')
let g:multi_f_key_list = [
    \ ['.', '。', '．'],
    \ [',', '、', '，'],
    \ ]
endif

function! s:SetKeyMap(list) abort
    for item in a:list
        let arr = []
        for i in item
            let j = "'" . i . "'"
            call add(arr, j)
        endfor
        let key_list = "[" . join(arr, ",") . "]"
        exe 'nnoremap <silent> ' . g:multi_f . item[0] . ' :<C-u>call multi_f#f(' . key_list . ')<CR>'
        exe 'nnoremap <silent> ' . g:multi_F . item[0] . ' :<C-u>call multi_f#F(' . key_list . ')<CR>'
        exe 'nnoremap <silent> ' . g:multi_t . item[0] . ' :<C-u>call multi_f#t(' . key_list . ')<CR>'
        exe 'nnoremap <silent> ' . g:multi_T . item[0] . ' :<C-u>call multi_f#T(' . key_list . ')<CR>'
        exe 'onoremap <silent><expr> ' . g:multi_f . item[0] . ' multi_f#of(' . key_list . ')'
        exe 'onoremap <silent><expr> ' . g:multi_F . item[0] . ' multi_f#oF(' . key_list . ')'
        exe 'onoremap <silent><expr> ' . g:multi_t . item[0] . ' multi_f#ot(' . key_list . ')'
        exe 'onoremap <silent><expr> ' . g:multi_T . item[0] . ' multi_f#oT(' . key_list . ')'
        exe 'xnoremap <silent><expr> ' . g:multi_f . item[0] . ' multi_f#of(' . key_list . ')'
        exe 'xnoremap <silent><expr> ' . g:multi_F . item[0] . ' multi_f#oF(' . key_list . ')'
        exe 'xnoremap <silent><expr> ' . g:multi_t . item[0] . ' multi_f#ot(' . key_list . ')'
        exe 'xnoremap <silent><expr> ' . g:multi_T . item[0] . ' multi_f#oT(' . key_list . ')'
    endfor
endfunction
call <SID>SetKeyMap(g:multi_f_key_list)

let &cpo = s:save_cpo
unlet s:save_cpo
