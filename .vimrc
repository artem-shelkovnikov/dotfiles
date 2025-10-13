set nocompatible

" Vim-Plug init
call plug#begin('~/.vim/plugged')
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
  Plug 'tmhedberg/SimpylFold'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
  " neotree + deps
  Plug 'nvim-neo-tree/neo-tree.nvim' | Plug 'nvim-lua/plenary.nvim' | Plug 'MunifTanjim/nui.nvim' | Plug 'nvim-tree/nvim-web-devicons'

  Plug 'neovim/nvim-lspconfig'
call plug#end()

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

au VimEnter * cd %:p:h

" highlight yanked text for 250ms
augroup Yank
au!
au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 250, higroup = "Visual" }
augroup END

" Remove trailing whitespace on save
let g:strip_whitespace = v:true
augroup Whitespace
au!
au BufWritePre * if g:strip_whitespace | %s/\s\+$//e
augroup END

" Neotree

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" lspconfig
lua << EOF
vim.lsp.config('ruff', {
  init_options = {
    settings = {
      -- Ruff language server settings go here
    }
  }
})

vim.lsp.enable('ruff')
EOF

" Vim SimpylFold
let g:SimpylFold_docstring_preview = 1

" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>


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
cnoreabbrev E :Neotree
