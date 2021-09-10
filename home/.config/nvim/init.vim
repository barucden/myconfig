" vim-plug
call plug#begin()
"Plug 'neovim/nvim-lspconfig'

" Language suports
Plug 'JuliaEditorSupport/julia-vim'

" Aligning
Plug 'junegunn/vim-easy-align'

" Color themes
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

" Colorscheme
colorscheme gruvbox8_hard
set termguicolors

" Show line numbers
set number
set relativenumber
" Show column and row number
set ruler
" Highlight the current line
set cursorline
" Alays show the status line
set laststatus=2 
" Enable syntax highlighting
syntax enable

" Allow backspace over anything
set backspace=indent,eol,start
" Allow unsaved buffers
set hidden

" Searching
set ignorecase
set smartcase
set incsearch
set wildmenu
set path+=**

" Expand tabs into spaces
set expandtab
" Tab size
set ts=4
set shiftwidth=4

" Unbind annoying default keybind
nmap Q <Nop>

" Detect filetypes and change indenting accordingly
filetype plugin indent on

" Remove all trailing whitespaces
autocmd FileType julia,python,c,cpp autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType tex setlocal indentexpr=

" Consider align/align* as a mathematical environment in tex files
autocmd FileType tex call TexNewMathZone("K", "align", 1)

" Keybindings

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" List the available buffers and prepare :b
nnoremap <Leader>b :ls<CR>:b<Space>
