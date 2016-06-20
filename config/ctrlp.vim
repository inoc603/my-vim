let g:ctrlp_cmd = "CtrlP"
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
    \ 'file': '\v\.(exe|pyc|min\.js|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

