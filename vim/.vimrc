call plug#begin('~/.vim/plugged')

Plug 'kballard/vim-swift'
Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'elixir-lang/vim-elixir'
Plug 'ekalinin/dockerfile.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
call plug#end()

set t_Co=256
set term=xterm-256color

syntax on

colorscheme nord
set mouse-=a
set statusline=%=%P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\
set laststatus=2
set noshowmode
set guifont="Fira Code"
set ttyfast
set backspace=2
set number

let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
