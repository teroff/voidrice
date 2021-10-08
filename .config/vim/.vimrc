" Config file for vim ~/.vimrc
"
" Stanislav Kozin ver 0.2 4-20-2021
" Updated clean-up stuff for vim

set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p')

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p')

if !has('nvim') | set viminfofile=$XDG_CACHE_HOME/vim/viminfo | endif

" End for clean-up stuff in vim

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
	set colorcolumn=80
"	set textwidth=80

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

" User urlview to choose and open a url:
    :noremap <leader>u :w<Home>silent <End> !urlview<CR>
