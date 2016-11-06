"" Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Enable filetype detection:
filetype on
filetype plugin on
filetype indent on

autocmd Filetype make set noexpandtab

"" Enable hidden buffers
set hidden

"" Directories for swp files
set nobackup
set noswapfile

"" Visual settings
syntax on
colorscheme ron
set ruler
set number

"" Enable modelines
set modeline
set modelines=5

"" Airline
let g:airline#extensions#tabline#enabled=2
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#right_sep=' '
let g:airline#extensions#tabline#right_alt_sep='|'
let g:airline_left_sep=' '
let g:airline_left_alt_sep='|'
let g:airline_right_sep=' '
let g:airline_right_alt_sep='|'
let g:airline_theme='gruvbox'

"" Mappings
:map <Leader>cr :w<Bar>execute 'silent !tmux send-keys -t right \!\! Enter'<Bar>redraw!<C-M>
:map <Leader>cb :w<Bar>execute 'silent !tmux send-keys -t bottom \!\! Enter'<Bar>redraw!<C-M>
:map <Leader>iso :w ++enc=iso-8859-1<C-M>
