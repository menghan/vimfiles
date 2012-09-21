setlocal nu
setlocal autoindent
setlocal incsearch
setlocal ignorecase
setlocal fileencodings=ucs-bom,utf-8,default,latin1
setlocal fileencoding=utf-8
setlocal fileformat=unix
syntax on
setlocal makeprg=jslint\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -process\ %
nnoremap <buffer> <F5> :make<CR>
