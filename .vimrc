"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
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

Plugin 'fatih/vim-go'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'marijnh/tern_for_vim'
Plugin 'mtscout6/syntastic-local-eslint.vim'

Plugin 'davidhalter/jedi-vim'
" Plugin 'klen/python-mode'


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
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
if $TERM_PROGRAM =~ "iTerm"
	let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
	let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
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
nmap <leader><space> :nohlsearch<CR>
map <space> /
map <C-space> ?
set ignorecase
set smartcase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic key map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

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
nmap <leader>w :w<CR>			" ,w to save	
nmap <leader>s :mksession<CR>		" ,s to save session
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap j gj
nnoremap k gk
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set whichwrap+=<,>,h,l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manually map Alt-j and Alt-k to work in Iterm2
map j <leader>j
map k <leader>k
" Move line(s) up and down
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv


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


