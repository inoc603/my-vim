set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Automatically close loc list when thers's no error
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Always populate loc list so lopen will have content
let g:syntastic_always_populate_loc_list = 1

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
	lopen
    endif
endfunction

map <leader>e :<C-u>call ToggleErrors()<CR>

