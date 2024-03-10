if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1

let g:sleuth_jin_heuristics = 0

setlocal matchpairs-=<:>
setlocal comments=://
setlocal commentstring=//%s
setlocal formatoptions=jcroql
setlocal smartindent nocindent
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
setlocal suffixesadd=.jin

augroup jin.vim
    autocmd!
augroup END
