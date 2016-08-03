set autoindent
set formatoptions=tcq2l
set textwidth=78 shiftwidth=2
setlocal sw=2 sts=2 et
" set foldmethod=syntax
let g:vim_json_warnings=1

" Use <space>pj to format JSON file
nmap <leader>pj :%!jq '.' 2> /dev/null; if [ "$?" -ne 0 ]; then cat %; fi<CR>
