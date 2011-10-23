function! Makeusaco()
	w
	if !filereadable('Makefile')
		let s:choice = confirm("No Makefile", "&Ok", 1)
		return
	endif
	silent !(make clean; f=`ls -lt *.cpp | head -n 1 | awk '{print $NF}'`; f=${f/cpp/exe}; make $f; rm -f current.exe; ln -s $f current.exe)
	if filereadable(expand('%:r') . '.exe')
		!./current.exe
	else
		let s:choice = confirm("Compile Error!", "&Neglect\n&View", 2)
		if s:choice == 2
			:copen
		endif
	endif
endfunction

function! USACO_Init()
	nnoremap <buffer> <F5> :call Makeusaco()<CR>
endfunction

" usaco configure"
autocmd BufRead,BufNewFile *.cpp let usacopath = expand("%:p:h") |
			\ if match(usacopath, 'usaco') >= 0|
			\ call USACO_Init() |
			\ endif

function! UpdateLastModifyTime()
	for lineno in range(1, 10)
		let line = getline(lineno)
		let time = strftime("%c")
		if match(line, 'Last update:') >= 0
			let line = substitute(line, 'Last update:.*', 'Last update: ' . time, "g")
			silent call setline(lineno, line)
			break
		endif
	endfor
endfunction
