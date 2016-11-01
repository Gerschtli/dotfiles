"" Colorscheme
colorscheme ron

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Enable hidden buffers
set hidden

"" Directories for swp files
set nobackup
set noswapfile

"" Visual settings
syntax on
set ruler
set number

"" Mappings
:map <Leader>lc :w<Bar>execute 'silent !tmux send-keys -t right \!\! Enter'<Bar>redraw!<C-M>
