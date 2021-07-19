" enable syntax highlight
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1


" use goimports on save
" let g:go_fmt_command = "goimports"
let g:go_fmt_command="gopls"
" let g:go_gopls_gofumpt=1
let g:go_imports_autosave=1

" disabled due to coc
" let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
