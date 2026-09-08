syntax on

" Set <Space> as the leader key
let mapleader=" "
let maplocalleader=" "


" Enable System-wide copy paste
set clipboard=unnamedplus

" Enable line numbers and relative line numbers
set number
set relativenumber

" Enable syntax highlighting
syntax on

" Enable mouse support
set mouse=a

" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable auto-indentation
set autoindent
set smartindent

" Enable search highlighting and incremental search
set hlsearch
set incsearch

" Ignore case in search, unless uppercase is used
set ignorecase
set smartcase

" Enable cursorline highlighting
set cursorline

" Show last 8 lines before cursor for Context
set scrolloff=8

" Enable true color support
set termguicolors

" Set colorscheme
colorscheme slate

" Enable folding
" set foldmethod=indent
" set foldlevelstart=99

" Key mappings

" jj for Normal Mode
inoremap jj <Esc>

" Space w to save
nnoremap <Leader>w :w<CR>

" Space q to exit
nnoremap <Leader>q :q<CR>


" Space e for file explorer
nnoremap <Leader>e :Explore<CR>

" Space f to find files
nnoremap <Leader>f :find 

" Space / to cleanup the search results
nnoremap <Leader>/ :nohlsearch<CR>

" Set cursor shape: block in normal, line in insert
if exists('$TERM')
  let &t_SI = "\e[6 q"   " Insert mode: line
  let &t_EI = "\e[2 q"   " Normal mode: block
endif

"""""""""""""""""""" TOMNOMNOM's vim file, without 3rd party plugins, plus my edits """"""""""""""""""""""""""

" Base64 decode word under cursor
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>

" grep recursively for word under cursor
" nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>

" sort the buffer removing duplicates
" nmap <Leader>x :%!sort -u --version-sort<CR>

" toggle line wrap, with F6
nnoremap <F6> :set wrap!<CR>

" Open file under cursor in new tab, with F9
nnoremap <F9> <C-W>gF:tabm<CR>


" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title

" Line wrapping
set nowrap
set linebreak
set showbreak=▹


" Make backspace a bit nicer
set backspace=eol,start,indent

" Indentation
set softtabstop=4
set shiftround


" CtrlC. Create new tab
nnoremap <C-c> <Esc>:tabe 
" Switch tabs. Ctrl h, l
nnoremap <C-h> gT
nnoremap <C-l> gt

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Go to start/end of line like in Bash, Doesnt work for some reason
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" Visual prompt for command completion
 set wildmenu


" A mode for quickly looking at lots of files
if $VIMENV == 'prev'
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
  noremap <C-D> :call delete(expand('%')) <bar> argdelete % <bar> bdelete<CR>
  set noswapfile
endif

set nocompatible
