Plugin 'tpope/vim-sensible'

" Some colorschemes 
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

Plugin 'bling/vim-airline'		" Simple status line
Plugin 'editorconfig/editorconfig-vim'	" Editorconfig
Plugin 'jiangmiao/auto-pairs'		" Auto pairs parenthesis
Plugin 'airblade/vim-gitgutter'		" Show git diff 
Plugin 'elzr/vim-json'			" Better JSON syntax
Plugin 'godlygeek/tabular'		
Plugin 'nathanaelkane/vim-indent-guides'	" Indent guide
Plugin 'easymotion/vim-easymotion'	" Makes moving aroung easier
Plugin 'tpope/vim-fugitive'		" Git intergration
Plugin 'tpope/vim-surround'		" Edit surrounds with ease 
" Plugin 'scrooloose/syntastic'		" Syntax check

Plugin 'scrooloose/nerdtree'		" Directory tree view
Plugin 'Xuyuanp/nerdtree-git-plugin'	" Show git status in nerdtree
so $HOME/.vim/config/nerdtree.vim

Plugin 'valloric/youcompleteme'		" Autocomplete
so $HOME/.vim/config/ycm.vim

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
so $HOME/.vim/config/ultisnips.vim

Plugin 'scrooloose/nerdcommenter'	" Code comment
so $HOME/.vim/config/nerdcommenter.vim

Plugin 'kien/ctrlp.vim'			" File and buffer searching
so $HOME/.vim/config/ctrlp.vim

Plugin 'benekastah/neomake'		" Syntax check
so $HOME/.vim/config/neomake.vim


Plugin 'fholgado/minibufexpl.vim'	" Buffer explorer
so $HOME/.vim/config/minibuffer.vim

Plugin 'majutsushi/tagbar'		" Tagbar to show code structure
so $HOME/.vim/config/tagbar.vim

Plugin 'christoomey/vim-tmux-navigator'	" Tmux intergration
so $HOME/.vim/config/tmux.vim

Plugin 'tpope/vim-obsession'		" Save vim session
so $HOME/.vim/config/obsession.vim

Plugin 'terryma/vim-multiple-cursors'	" Multicursor editing
so $HOME/.vim/config/multiple-cursor.vim

Plugin 'jszakmeister/vim-togglecursor'	" Change cursor shape
so $HOME/.vim/config/togglecursor.vim

Plugin 'mileszs/ack.vim'		" Search in project
so $HOME/.vim/config/ack.vim

Plugin 'plasticboy/vim-markdown'	" Markdown support
so $HOME/.vim/config/markdown.vim

" Golang
Plugin 'fatih/vim-go'
so $HOME/.vim/config/go.vim

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'marijnh/tern_for_vim'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'posva/vim-vue'
Plugin 'digitaltoad/vim-pug'
so $HOME/.vim/config/js.vim

" Python
" Plugin 'davidhalter/jedi-vim'
so $HOME/.vim/config/python.vim
so $HOME/.vim/config/jedi.vim

" Rust
Plugin 'rust-lang/rust.vim'
