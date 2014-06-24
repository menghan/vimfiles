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

" go get -u github.com/nsf/gocode for daemon
" disable auto fmt on write
let g:did_ftplugin_go_fmt = 1
Bundle 'menghan/vim-gocode'

" zencoding
Bundle 'Emmet.vim'

Bundle 'python.vim'
Bundle 'mako.vim'
Bundle 'menghan/mako.vim--Torborg'
Bundle 'hynek/vim-python-pep8-indent'
" Bundle 'menghan/pydoc.vim--Repass'
Bundle 'mattn/gist-vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'menghan/vim-fugitive'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'lepture/vim-jinja'

let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
Bundle 'taglist.vim'

let g:fencview_autodetect = 0
Bundle 'mbbill/fencview'

let NERDCommentWholeLinesInVMode = 1
let NERDShutUp = 1
let NERDSpaceDelims = 1
let NERDMenuMode = 0
Bundle 'scrooloose/nerdcommenter'

let g:cmdline_complete_no_python = 1
Bundle 'menghan/CmdlineComplete'

" let g:shirevim#app = 'movie'
" " disable <Ctrl-P> mapping
" let loaded_shirevim_config = 1
" Bundle 'http://code.dapps.douban.com/menghan/shire_vim.git'

" Example Bundles here:

" " original repos on github
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
