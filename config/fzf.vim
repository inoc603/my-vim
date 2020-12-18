nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>rp :execute "Ag" expand("<cword>")<CR>

let g:fzf_layout = { 'window': { 'height': 0.8, 'width': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'
