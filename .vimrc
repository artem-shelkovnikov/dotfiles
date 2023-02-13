set nocompatible

" Vim-Plug init
call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized' |
  Plug 'morhetz/gruvbox' |
  Plug 'vim-airline/vim-airline' |
  Plug 'vim-airline/vim-airline-themes' |
  Plug 'dense-analysis/ale' |
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ } |
  Plug 'junegunn/fzf' |
  Plug 'tmhedberg/SimpylFold'
call plug#end()

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Vim LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

" Vim SimpylFold
let g:SimpylFold_docstring_preview = 1

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> rr <Plug>(lcn-rename)


" Set the color scheme
syntax on
set background=dark
colorscheme gruvbox

" Python folding
set foldmethod=indent
nnoremap <space> za
vnoremap <space> zf

" Basic stuff
set encoding=UTF-8
set history=100
set autoread
set hidden

" Swap files
set noswapfile

" Text
set spell

" UI
set title
set number
set ruler
set wildmenu
set cursorline
set mouse=a

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Splits
set splitbelow
set splitright

" Formatting and spaces
set expandtab
set smarttab
set tabstop=4

" Filetypes stuff starts
filetype plugin indent on
filetype off
filetype indent on

" Keybindings
cnoreabbrev E Ex
