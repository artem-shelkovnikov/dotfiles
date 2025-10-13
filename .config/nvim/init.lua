require("config.lazy")
vim.diagnostic.config({ virtual_text = true })
vim.g.loaded_python3_provider = 0

vim.cmd([[
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


        " Python folding
        set foldmethod=indent
        nnoremap <space> za
        vnoremap <space> zf

        " Fold nav
        nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
        nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

        func! NextClosedFold(dir)
            let cmd = 'norm!z'..a:dir
            let view = winsaveview()
            let [l0, l, open] = [0, view.lnum, 1]
            while l != l0 && open
                exec cmd
                let [l0, l] = [l, line('.')]
                let open = foldclosed(l) < 0
            endwhile
            if open
                call winrestview(view)
            endif
        endfunc

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
        filetype indent on

        " Keybindings
        cnoreabbrev E :Neotree
]])
