let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Close preview window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
