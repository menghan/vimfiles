"python configure

setlocal nu
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal expandtab
setlocal smarttab
setlocal autoindent
setlocal backspace=indent,eol,start
setlocal incsearch
setlocal ignorecase
setlocal ruler
setlocal wildmenu
setlocal commentstring=\ #\ %s
setlocal foldlevel=99
setlocal fdm=indent
setlocal fileencodings=ucs-bom,utf-8,default,latin1
setlocal fileencoding=utf-8
setlocal fileformat=unix
setlocal virtualedit=block
setlocal scrolloff=3
syntax on

let python_highlight_all = 1

nnoremap <buffer> <leader>rr :!python %<CR>
nnoremap <buffer> <leader>rd :!python -m pdb %<CR>
nnoremap <buffer> <leader>rt :!python -m doctest %<CR>
setlocal errorformat=%f:%l:%n:\ %m
setlocal makeprg=pep8\ --repeat\ --max-line-length=100\ %
setlocal shellpipe=>%s\ 2>&1
nnoremap <buffer> <F5> :make<CR>
nnoremap <buffer> <leader>rpd :!autopep8 --ignore=E126,E127 --max-line-length=999 --diff % \| cdiff<CR>
nnoremap <buffer> <leader>rpa :!autopep8 --ignore=E126,E127 --max-line-length=999 -i %<CR>

if has('unix')
	nnoremap <buffer> <leader>r3 :!python3 %<CR>
endif

inoreabbrev <buffer> pdbst __import__('pdb').set_trace()
inoreabbrev <buffer> ppppp __import__('pprint').pprint()

" from http://vim.wikia.com/wiki/Highlight_long_lines
"highlight columns over 80

" Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
" set omnifunc=pythoncomplete#Complete
" inoremap <Nul> <C-x><C-o>

" Wrap at 72 chars for comments.
" set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Highlight bzr merge markers.
highlight MergeMarker guibg=red ctermbg=red
match MergeMarker /^[<=>\|]\{7\}\( [A-Z]\+\)?$/

function! UsePython()
" `gf` jumps to the filename under the cursor.  Point at an import statement
" and jump to it!
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endfunction

" Use :make to see syntax errors. (:cn and :cp to move around, :dist to see
" all errors)
" developing website don't need this, by Menghan
" set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
" set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" if has('python')
"     call UsePython()
" endif
