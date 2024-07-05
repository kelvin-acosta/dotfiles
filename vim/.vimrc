call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'ekalinin/dockerfile.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

syntax enable
set t_Co=256
set term=xterm-256color
set laststatus=2
set guifont="JetBrains Mono"
set ttyfast
set backspace=2
set number
set termguicolors
set smartindent
set hlsearch
set undofile
set undodir=$HOME/.cache/vim/undo
set timeoutlen=500
set showtabline=2
set autoindent
colorscheme catppuccin_mocha

let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
