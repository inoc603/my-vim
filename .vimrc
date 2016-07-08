"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'

" Some colorschemes 
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

Plugin 'bling/vim-airline'		" Simple status line
Plugin 'scrooloose/nerdtree'		" Directory tree view
Plugin 'Xuyuanp/nerdtree-git-plugin'	" Show git status in nerdtree
Plugin 'valloric/youcompleteme'		" Autocomplete
Plugin 'easymotion/vim-easymotion'	" Makes moving aroung easier
Plugin 'scrooloose/nerdcommenter'	" Code comment
Plugin 'kien/ctrlp.vim'			" File and buffer searching
Plugin 'tpope/vim-fugitive'		" Git intergration
Plugin 'scrooloose/syntastic'		" Syntax check
Plugin 'tpope/vim-surround'		" Edit surrounds with ease 
Plugin 'fholgado/minibufexpl.vim'	" Buffer explorer
Plugin 'majutsushi/tagbar'		" Tagbar to show code structure
Plugin 'jiangmiao/auto-pairs'		" Auto pairs parenthesis
Plugin 'editorconfig/editorconfig-vim'	" Editorconfig
Plugin 'christoomey/vim-tmux-navigator'	" Tmux intergration
Plugin 'tpope/vim-obsession'		" Save vim session
Plugin 'nathanaelkane/vim-indent-guides'	" Indent guide
Plugin 'terryma/vim-multiple-cursors'	" Multicursor editing
Plugin 'airblade/vim-gitgutter'		" Show git diff 

" Golang
Plugin 'fatih/vim-go'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'marijnh/tern_for_vim'
Plugin 'mtscout6/syntastic-local-eslint.vim'

" Python
Plugin 'davidhalter/jedi-vim'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Vertical line cursor in insert mode, block cursor in normal mode
" Works on iTerm2, and with tmux
if $TERM_PROGRAM =~ "iTerm"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7" 
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


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
map <silent><leader>h :nohlsearch<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic key map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use space as leader key
let mapleader=' '

" Enter command mode without pressing shift
noremap ; :

" Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Use jk or kj to switch to normal mode
inoremap jk <Esc>
inoremap kj <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick save
nmap <leader>w :w<CR>			
" Quickly close current window
nmap <leader>q :q<CR>			" 
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
nnoremap H ^
nnoremap L $

" Use Ctrl-j,k,h,l to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


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
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv
map <A-j> <leader>j
map <A-k> <leader>k
" Special mapping for Alt to work with iTerm2 on mac
map ∆ <leader>j
map ˚ <leader>k


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sourcing custom config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so $HOME/.vim/config/tmux.vim
so $HOME/.vim/config/syntastic.vim
so $HOME/.vim/config/obsession.vim
so $HOME/.vim/config/ctrlp.vim
so $HOME/.vim/config/tagbar.vim
so $HOME/.vim/config/nerdcommenter.vim
so $HOME/.vim/config/nerdtree.vim
so $HOME/.vim/config/js.vim
so $HOME/.vim/config/python.vim
so $HOME/.vim/config/go.vim
so $HOME/.vim/config/minibuffer.vim
so $HOME/.vim/config/jedi.vim

