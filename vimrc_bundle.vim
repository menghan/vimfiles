set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'suan/vim-instant-markdown'
Bundle 'mru.vim'
Bundle 'bufexplorer.zip'
Bundle 'snipMate'
Bundle 'torte.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'ZenCoding.vim'
Bundle 'python.vim'
Bundle 'mako.vim'
Bundle 'menghan/mako.vim--Torborg'

let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
Bundle 'taglist.vim'

let g:fencview_autodetect = 0
Bundle 'mbbill/fencview'

let NERDCommentWholeLinesInVMode = 1
let NERDShutUp = 1
let NERDSpaceDelims = 1
let NERDMenuMode = 0
Bundle 'scrooloose/nerdcommenter'

let g:shirevim#app = 'movie'
Bundle 'http://code.dapps.douban.com/menghan_shire_vim.git'

" Example Bundles here:

" " original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
" Bundle 'L9'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
