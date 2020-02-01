let g:python_host_prog = '/root/.pyenv/shims/python'
let g:python3_host_prog = '/root/.pyenv/shims/python3'

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_maker = {
            \ 'args': ['--no-color', '--format', 'compact'],
            \ 'errorformat': '%f: line %l\, col %c\, %m'
            \ }

function! NeomakeESlintChecker()
  let l:eslint = 'eslint'
  if executable('npm-which')
    let l:eslint = split(system('cd ' . expand("%:p:h") . ';npm-which eslint'))[0]
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction

autocmd FileType javascript :call NeomakeESlintChecker()

let g:neomake_python_enabled_makers = ['python', 'pylint']
if executable('pyre')
	call extend(g:neomake_python_enabled_makers, ['pyre'])
endif
let g:neomake_python_pyre_maker = {
	\ 'args': ['--noninteractive'],
	\ 'append_file': 0,
	\ 'errorformat': '%f:%l:%c %m'
	\ }

fun! RunNeomake()
    " Don't strip on these filetypes
    if &ft =~ 'go'
	return
    endif
    Neomake
endfun

autocmd! BufWritePost * call RunNeomake()
autocmd! BufWritePost *.py :Black
