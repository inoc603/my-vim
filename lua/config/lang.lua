local use = require("packer").use


use { 'elzr/vim-json', ft = 'json' }

vim.g.vim_markdown_folding_disabled = 1

use { 'plasticboy/vim-markdown', requires = {'godlygeek/tabular'}, ft = 'markdown' }

use { 'rust-lang/rust.vim', ft = 'rust' }

use { 'cespare/vim-toml', ft = 'toml' }

use { 'solarnz/thrift.vim', ft = 'thrift' }

use { 'jparise/vim-graphql', ft = 'graphql' }

use { 'andys8/vim-elm-syntax', ft = "elm" }

-- JavaScript
use { 'posva/vim-vue', ft = 'vue' }
use { 'digitaltoad/vim-pug', ft = 'pug' }
use { 'leafgarland/typescript-vim', ft = "typescript" }
use { 'ianks/vim-tsx', ft = "typescript" }
