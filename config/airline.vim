" let g:airline_solarized_bg='dark'

let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" These only works on iTerm2
" Alt-l to swtich to last used buffer
map ¬ :b#<CR>
" Alt-o to switch to previous buffer(left)
"
map ø :bprevious<CR>
nmap - :bprevious<CR>
" Alt-p to switch to next buffer(right)
map π :bnext<CR>
nmap = :bnext<CR>
