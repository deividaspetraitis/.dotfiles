" Use Vim settings, rather than Vi settings
set nocompatible
filetype off

" For some reason it solves issues with Vundle Plugin Manager
set shell=/bin/bash

" .vim contains ftype and other files
set rtp+=~/.dotfiles/nvim

set rtp+=~/.dotfiles/nvim/.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on    " required
"filetype plugin indent off

"###########################################################################
" Vim system settings
" PLUGINS SETTINGS HAS DEDICATED SECTION BELOW, DO NOT MIX

" When your .vimrc file is sourced twice, the autocommands will appear twice.
" To avoid this, put this command in your .vimrc file, before defining
" autocommands:
" Remove ALL autocommands for the current group.
autocmd!

" Flash screen instead of beep sound
set visualbell

" Change how vim represents characters on the screen
set encoding=utf-8

" Set the encoding of files written
set fileencoding=utf-8

" Indent by 2 spaces when hitting tab
set softtabstop=2

" Indent by 4 spaces when auto-indenting
set shiftwidth=4

" Show existing tab with 4 spaces width
set tabstop=4

filetype plugin indent on

" Enable syntax highlighting
syntax on

" Enable spell checking
set spell

set tabpagemax=100

" Set leader key
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" Display line numbers
set number

" Set relative numbers
set relativenumber
" Enable relative numbers only in Normal mode, and absolute numbers only in Insert mode.
" I don't actually like toggling
" augroup toggle relative number
" autocmd InsertEnter * :setlocal norelativenumber
" autocmd InsertLeave * :setlocal relativenumber

" Show status line
set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number

" Backspace fix
set backspace=indent,eol,start

" Display the commands as you type it in Vim
set showcmd

" Mark the line the cursor is currently in
set cursorline

" Always show cursor position
set ruler

" Enable project specific .vimrc
set exrc

" Maintain undo history between sessions
set undofile   

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu

" Dedicated directory for these undo history files
set undodir=~/.vim/undodir

" Dedicated swap files directory ( instead of .swp files in project dir )
set directory=~/.vim/swpdir//

" Append working directory to the PATH, so we can use find to search project
" files recursively.
set path+=$PWD/**

" Syntax folding
" Folds are defined by syntax highlighting
set foldmethod=syntax
" By default set fold level start 1 just to be awere such functionallity
" and employ it in daily work
set foldlevelstart=1
" :autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" Display a smalll column to visually indicate folds
set foldcolumn=2

" While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

set clipboard+=unnamedplus

" If you don't want to turn 'hlsearch' on, but want to highlight all
" 	matches while searching, you can turn on and off 'hlsearch' with
" 	autocmd.  Example: >
augroup vimrc-incsearch-highlight
 autocmd!
 autocmd CmdlineEnter /,\? :set hlsearch
 autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" The original meaning of Ctrl-j is 'move [n] lines downward'
" Turn off it.
let g:C_Ctrl_j   = 'off'
let g:C_Ctrl_k   = 'off'


