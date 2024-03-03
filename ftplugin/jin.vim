if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1

augroup jin.vim
    autocmd!

    setlocal sts=4 sw=4 ts=4
    setlocal matchpairs-=<:>
    setlocal comments=://
    setlocal commentstring=//\ %s
    setlocal formatoptions=jcroql

    if get(g:, "jinFolding", 0)
      setlocal foldmethod=expr
      setlocal foldexpr=jin#Fold()
    endif
augroup END

setlocal sw=4 sts=4 ts=4 expandtab
