" Use Vim settings, rather than Vi settings
set nocompatible

filetype off

" For some reason it solves issues with Vundle Plugin Manager
set shell=/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on    " required

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

" Open pop up widow instead of opening split window
set previewpopup=height:10,width:60,highlight:PMenuSbar
set completeopt+=popup
set completepopup=height:15,width:60,border:off,highlight:PMenuSbar

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

" Keep a backup copy of a file when overwriting it.
if has("vms")
  set nobackup
else
  set backup
  if has('persistent_undo')
    " Maintain undo history between sessions
	set undofile
  endif
endif

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu

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

" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" cursor shape based on mode
let &t_SI = "\e[6 q" "SI = INSERT mode
let &t_EI = "\e[2 q" "EI = NORMAL mode (ELSE)

" TODO: does not work
autocmd VimEnter * let &t_EI = "\e[6 q"
autocmd VimLeave * let &t_EI = "\e[2 q"

" yank to system clipboard 
if system('uname -s') == "Darwin\n"
  "OSX
  set clipboard=unnamed 
else
  "Linux
  set clipboard=unnamedplus
endif

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

" Tweak escape time from INSERT mode to NORMAL
" to switch instantly with no delay
set ttimeout
set ttimeoutlen=1

" Plugin(s) settings
source $DOTDIR/.vim/plugins/plugins.vim

"###########################################################################
" Mappings
"###########################################################################

"This is how it worked before Vim 5.0. 
" Otherwise the "Q" command starts Ex mode, but you will not need it.
map Q gq
inoremap <C-U> <C-G>u<C-U>

" NERDTree plugin specific commands
" Toggle ON/OFF tree F6
nmap <F6> :NERDTreeToggle<CR>

" Show your next matched string at the center of the screen when you press n 
" or N, so it is easier to identify your location in the file
nnoremap n nzz 
nnoremap N Nzz

" Navigation between splits, instead of CTRL-W then J, it’s just CTRL-J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
noremap <silent> <C-l> :call TmuxMove('l')<cr>

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Tab for [t]abs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"###########################################################################
" Custom Vim mappings using the leader key
" Defining a leader key is one of the best things you can do to boost your productivity in Vim.
" You can define leader shortcuts for your most used commands.

" Quick write shortcut
nnoremap <Leader>w :w<CR>

" Window splitting
nnoremap <Leader>l :set splitright<CR> <C-W>v
nnoremap <Leader>h :set nosplitright<CR> <C-W>v
nnoremap <Leader>j :set splitbelow<CR> <C-W>s
nnoremap <Leader>k :set nosplitbelow<CR> <C-W>s

nnoremap <Leader>r :source ~/.vimrc <CR>

" Same as fg but allows to open and edit non-existing file
noremap <leader>gf :e <cfile><cr>

" Vim sessions management
exec 'nnoremap <Leader>ss :mks! ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'

" Display cursor line only in a active window.
" https://codeyarns.com/tech/2013-02-07-how-to-show-cursorline-only-in-active-window-of-vim.html#gsc.tab=0
augroup CursorLineOnlyInActiveWindow 
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup end

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Quite a few people accidentally type "q:" instead of ":q" and get confused
" by the command line window.  Give a hint about how to get out.
" If you don't like this you can put this in your vimrc:
" ":augroup vimHints | exe 'au!' | augroup END"
augroup vimHints
au!
autocmd CmdwinEnter *
  \ echohl Todo | 
  \ echo 'You discovered the command-line window! You can close it with ":q".' |
  \ echohl None
augroup END

" Auto generate tags file on file write of *.c and *.h files
" autocmd BufWritePost *.c,*.h,*.go silent! !ctags . &
"###########################################################################
" General Autocmd's
"
" NOTE: File specific cmd's goes into: ~/.vim/ftplugin/{filetype}_whatever.vim
"###########################################################################
