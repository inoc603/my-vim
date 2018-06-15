"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

so $HOME/.vim/config/plugins.vim

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set bg=dark
let g:solarized_termtrans = 1
colorscheme solarized
set colorcolumn=80
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set scrolloff=7		" keep some lines visible when moving cursor
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
set ttyfast
set lazyredraw
set synmaxcol=256
set guicursor=i:ver25	" turn cursor to vertical line in insert mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wild menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set ignorecase
set smartcase
" Cancel highlight when you're done seraching
map <silent><F10> :nohlsearch<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic key map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use space as leader key
let mapleader=' '

" Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Use kj to switch to normal mode
inoremap kj <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick save
nmap <leader>w :w<CR>			
" Close current window
nmap <leader>q :q<CR>
" Close all windows
nmap <leader>Q :qall<CR>
" Save session
nmap <leader>s :mksession<CR>		
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines
nnoremap j gj
nnoremap k gk
set whichwrap+=<,>,h,l

" Use H/L to move to start/end of line
" Also remap common combination because H/L are originally used to go to
" top/bottom of window
nnoremap H ^
nnoremap L $
nnoremap cH c^
nnoremap cL c$
nnoremap dH d^
nnoremap dL d$
vnoremap H ^
vnoremap L $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Ctrl-j,k,h,l to move between windows
" With the christoomey/vim-tmux-navigator plugin you can navigate between tmux
" and vim windows seamlessly
if mapcheck("<C-j>", ":TmuxNavigateDown") == ""
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l
endif

nmap <leader>h :split<CR>
nmap <leader>v :vsplit<CR>

" Toggle location and quick fix window
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec('botright '.a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix", 'c')<CR>

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

set diffopt=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy and Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Ctrl-c and Ctrl-v to copy and paste to system clipboard
vmap <C-c> "*yy
nmap <C-v> "*p
imap <C-v> <Esc><C-v>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move line(s) up and down
" How I want to move lines, though it never works in Iterm2, even you set your
" alt key to act as meta key
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Insert new line using enter
nnoremap <CR> o<Esc>

" Special mapping for Alt to work with iTerm2 on mac, with default setting
" If alt key is configured to send +Esc, you can have a mapping with an
" invisible prefix, but you'll often accidentally move your code when exiting
" insert mode
map ∆ <A-j>
map ˚ <A-k>

" Stay in visual mode after indent
vnoremap > >gv
vnoremap < <gv

set autowriteall

so $HOME/.vim/config/plugins-config.vim
