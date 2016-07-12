
map <Leader>b :MBEToggle<cr>

" These only works on iTerm2
" Alt-l to swtich to last used buffer
map ¬ :MBEbun<CR>
" Alt-o to switch to previous buffer(left)
map ø :MBEbp<CR>
" Alt-p to switch to next buffer(right)
map π :MBEbn<CR>

let g:miniBufExplForceSyntaxEnable = 1

function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

command! Bdi :call DeleteInactiveBufs()
