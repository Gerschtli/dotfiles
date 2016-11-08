"" Plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'vim-airline/vim-airline'
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
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

""" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" Mappings
:map <Leader>cr :w<Bar>execute 'silent !tmux send-keys -t right \!\! Enter'<Bar>redraw!<C-M>
:map <Leader>cb :w<Bar>execute 'silent !tmux send-keys -t bottom \!\! Enter'<Bar>redraw!<C-M>
:map <Leader>iso :w ++enc=iso-8859-1<C-M>
