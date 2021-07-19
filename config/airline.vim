let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" - to switch to previous buffer(left)
nmap - :bprevious<CR>
" = to switch to next buffer(right)
nmap = :bnext<CR>

" These only works on iTerm2
" Alt-l to swtich to last used buffer
map ¬ :b#<CR>

