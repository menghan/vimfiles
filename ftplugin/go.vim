setlocal number
setlocal foldmethod=syntax

nnoremap <buffer> <F5> :make<CR>

" run :GoBuild or :GoTestCompile based on the go file
" https://github.com/fatih/vim-go-tutorial/blob/master/README.md#vimrc-improvements
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
nnoremap <leader>gb :<C-u>call <SID>build_go_files()<CR>
nnoremap <Leader>gc <Plug>(go-coverage-toggle)

" https://github.com/fatih/vim-go-tutorial/blob/master/README.md#fix-it
setlocal autowrite

" https://github.com/fatih/vim-go-tutorial/blob/master/README.md#vimrc-improvements
let g:go_list_type = "quickfix"

" https://github.com/fatih/vim-go-tutorial/blob/master/README.md#test-it
let g:go_test_timeout = '10s'

" https://github.com/fatih/vim-go-tutorial/blob/master/README.md#imports
let g:go_fmt_command = "goimports"

" https://github.com/fatih/vim-go-tutorial/blob/master/README.md#check-it
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

let g:go_auto_type_info = 1
setlocal updatetime=100

" generate tags. from https://github.com/jstemmer/gotags
nnoremap <buffer> <leader>ut :!find . "$GOPATH/src" "$GOROOT/src" -name "*.go" \| xargs gotags > tags<CR>
let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }
