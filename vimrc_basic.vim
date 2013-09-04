" [options]
colorscheme torte
syntax on
filetype on
filetype indent on
filetype plugin on
" set cursorcolumn
set nocompatible
set nobackup
" set cindent
set autoindent
set smartindent
set hidden
" set wildmode=list:full "auto complete
" set wildmenu
" set completeopt=longest,menu,preview
set backspace=indent,eol,start
set mouse=a "allow mouse
" set clipboard+=unnamed "share the common clipboard with other applications
set titlestring=%F
set tags=./tags;
set helplang=cn
set grepprg=grep\ -nH\ $*
set guioptions=egmt "不显示工具条(T)和滚动条(r)
set winaltkeys=no "防止windows解释alt组合键
set showcmd
set showmatch " show matching brackets
set ignorecase
set smartcase
set hlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set ambiwidth=double
set display=lastline,uhex
" set fillchars=vert:\|,fold:-
" set formatoptions+=Mmn
set guitablabel=%{tabpagenr()}.%t\ %m
" set tabline
set wildignore=*.lo,*.o,*.obj,*.exe,*.pyc,*.ptlc " tab complete now ignores these
set modeline
set modelines=5

" [diff options]
set diffopt=filler,vertical

" [status line]
set ruler
set statusline=%k(%02n)%t%m%r%h%w\ \[%{&ff}:%{&fenc}:%Y]\ \[line=%04l/%04L\ col=%03c/%03{col(\"$\")-1}]\ [%p%%]
set laststatus=2

" [tab stop options]
set tabstop=8
set softtabstop=8
set smarttab " use tabs at the start of a line,spaces elsewhere
set shiftwidth=8

" [mappings]
let mapleader=','

nnoremap <leader>q :q!<CR>
nnoremap <leader>w :up<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>co :copen<CR>
nnoremap <leader>pt :set paste!<CR>
nnoremap <leader>m :MRU<CR>
inoremap jk <ESC>
nnoremap <leader>cls m`:silent! %s/\s\+$//g<CR>``
nnoremap <leader>clt m`:silent! %s/\t/\ \ \ \ /g<CR>``
nnoremap <leader>rp :%s/<C-R>//

" open file
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR><C-D>
noremap <leader>s :split <C-R>=expand("%:p:h") . "/" <CR><C-D>
noremap <leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR><C-D>
noremap <leader>t :tabnew <C-R>=expand("%:p:h") . "/" <CR><C-D>

" emacs editing style in cmdline
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>

" insert/visual mode movement
inoremap <C-L> <right>
inoremap <C-H> <left>
inoremap <C-J> <down>
inoremap <C-K> <up>
inoremap <C-A> <C-O>I
inoremap <C-E> <C-O>A
vnoremap <C-L> <right>
vnoremap <C-H> <left>
vnoremap <C-J> <down>
vnoremap <C-K> <up>

" Up down move
nnoremap    j       gj
nnoremap    k       gk
nnoremap    gj      j
nnoremap    gk      k

"do some useful map
nnoremap Y y$
nnoremap ]] ][
nnoremap ][ ]]

" misc
nnoremap    J       gJ
nnoremap    gJ      J
nnoremap    -       _
nnoremap    _       -

" windows navigation maps
" goto upper/lower window and max it
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <c-h> gT
nnoremap <c-l> gt

" Scroll up and down in Quickfix
nnoremap    <c-n>   :cn<cr>
nnoremap    <c-p>   :cp<cr>

" Easy indent in visual mode
xnoremap    <   <gv
xnoremap    >   >gv

" win32 configure
if has("win32")
	nnoremap <leader>exp :silent !start explorer "%:p:h"<CR>
	nnoremap <leader>cmd :silent !start cmd /K "cd /d %:p:h"<CR>
endif

" cscope config"
function! ConfigCscope()
	nnoremap <buffer> <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <buffer> <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <buffer> <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nnoremap <buffer> <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endfunction

" nerdtree
nnoremap <leader>nt :NERDTreeToggle<CR>

" [autocmds]

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" cscope
if has("cscope")
	autocmd BufRead,BufNewFile  *.c,*.cpp,*.cc,*.h,*.hpp call ConfigCscope()
endif

" mutt configure"
autocmd BufRead /tmp/mutt-* set tw=72

" bash/sh configure"
autocmd bufnewfile *.sh call setline(1,'#!/usr/bin/env bash') |
    \ call setline(2,'') |
    \ call setline(3,'') |
    \ exe "normal G" |
    \ exe "w" |
    \ exe "!chmod +x %"

"don't load color's menu
let g:did_color_sample_pack = 1

"still not understand
"run ex and normal command and redirect message to register *, use try-finally
"to ensure that redir END will always be executed
"command -nargs=* Mc redir @*> |try| exe "<args>" | finally | redir END | endtry
"command -nargs=* Mn redir @*> |try| normal "<args>" | finally | redir END | endtry
