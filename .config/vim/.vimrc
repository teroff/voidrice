" Config file for vim ~/.vimrc
"
" Stanislav Kozin ver 0.1  07-15-2020

" Keyboard binding and plugins
	let mapleader=" "

" Some basics
	syntax on
	filetype plugin on
	set encoding=utf-8
	set number relativenumber
	set autoindent
	set nocompatible
	set tabstop=4 softtabstop=4
	set ruler
	set noswapfile
	set undodir=~/.vim/undodir
	set undofile
	set noerrorbells
	set showbreak=+++

" Search related settings
	set incsearch
	set showmatch
	set hlsearch
	set ignorecase
	set nowrap

" Colors and text
	colorscheme desert
"	set termguicolors
"	set colorcolumn=80
	set textwidth=79

" Enable autocomplete
	set wildmode=longest,list,full

" Splits open at the bottom and right
	set splitbelow splitright

" Enable syntax highlighting for python codes
	let python_highlight_all = 1

" control the number of tabs that will be used by vim when tab key will pressed
	set shiftwidth=8

" Add 4 spaces for each tab
	set ts=4

" convert all new tab character into space
	set expandtab

" Use the fileformat
	set fileformat=unix

" EXECUTION COMMANDS SECTION

" Automatically deletes all trailing whitespaces
	autocmd BufWritePre * %s/\s\+$//e

" Disable autocommenting on newlines
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Execute Python code
    autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" Split navigation
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

