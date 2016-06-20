" enable syntax highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" use goimports on save
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

" syntastic compatability
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }
