Plug 'tpope/vim-sensible'

" Colorschemes 
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Directory tree view
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Show git status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Closing buffer
Plug 'rbgrouleff/bclose.vim'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'   " Search in project
Plug 'tpope/vim-abolish' " Search and replace

Plug 'christoomey/vim-tmux-navigator' " Seamless navigation in vim and tmux panel
Plug 'edkolev/tmuxline.vim'           " Tmux status line intergration

Plug 'airblade/vim-gitgutter'      " Show git diff
Plug 'tpope/vim-fugitive'          " Git intergration
Plug 'iberianpig/tig-explorer.vim' " Using tig in vim

Plug 'nathanaelkane/vim-indent-guides'	" Indent guide
Plug 'majutsushi/tagbar'		" Tagbar to show code structure

Plug 'jiangmiao/auto-pairs'          " Auto pairs parenthesis
Plug 'easymotion/vim-easymotion'     " Makes moving aroung easier
Plug 'tpope/vim-surround'            " Edit surrounds with ease
Plug 'scrooloose/nerdcommenter'      " Code comment
Plug 'terryma/vim-multiple-cursors'  " Multicursor editing
Plug 'junegunn/vim-easy-align'       " Code alignment
Plug 'editorconfig/editorconfig-vim' " Editorconfig
Plug 'honza/vim-snippets'            " Common snippets
Plug 'benekastah/neomake'            " Syntax check

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' } " Python formatter

" JSON
Plug 'elzr/vim-json', { 'for': 'json' }

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Golang
Plug 'fatih/vim-go', { 'for': 'go' }

" JavaScript
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Thrift
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }

" GraphQL
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
