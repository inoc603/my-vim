autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_maker = {
            \ 'args': ['--no-color', '--format', 'compact'],
            \ 'errorformat': '%f: line %l\, col %c\, %m'
            \ }

function! NeomakeESlintChecker()
  let l:eslint = 'eslint'

  if executable('npm-which')
    let l:eslint = split(system('npm-which eslint'))[0]
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction

autocmd FileType javascript :call NeomakeESlintChecker()
