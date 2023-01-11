" Use Vim settings, rather than Vi settings
set nocompatible

filetype off

" For some reason it solves issues with Vundle Plugin Manager
set shell=/bin/bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugin manager settings  ---------------------- {{{
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vim Hardtime helps you break that annoying habit vimmers have of scrolling up and down the page using jjjjj and kkkkk but without compromising the rest of our vim experience.
Plugin 'takac/vim-hardtime'

" YouCompleteMe: a code-completion engine for Vim
Plugin 'ycm-core/YouCompleteMe'

" UltiSnips is the ultimate solution for snippets in Vim. It has many features, speed being one of them. Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Minimal Vim Go formatter plugin
" The contents of this plugin are pure copy-paste from the awesome vim-go repo.
Plugin 'darrikonn/vim-gofmt'

" Light & Dark color schemes for terminal and GUI Vim awesome editor
" Inspired by Google's Material Design. Improve code readability! Great for presentation!
Plugin 'NLKNguyen/papercolor-theme'

" Repeat.vim remaps . in a way that plugins can tap into it.
Plugin 'tpope/vim-repeat'

" The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plugin 'tpope/vim-surround'

" A plugin to place, toggle and display marks
Plugin 'kshenoy/vim-signature'

" Peekaboo will show you the contents of the registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in insert mode
Plugin 'junegunn/vim-peekaboo'

" Tree-sitter is a parser generator tool and an incremental parsing library.
" It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited. 
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Telescope.nvim is a highly extendable fuzzy finder over lists.
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Focus on the task and temporarily disable the distraction elements in Neovim
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim' " dim all lines except the current line when turned on.

" More Pleasant Editing on Commit Message
Plugin 'rhysd/committia.vim'

" VimWiki is a personal wiki for Vim
Plugin 'vimwiki/vimwiki'

" Fugitive is the premier Vim plugin for Git
Plugin 'tpope/vim-fugitive'

" Pomodoro plugin
Plugin 'tricktux/pomodoro.vim'

" Commenting plugin
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

"###########################################################################
" Vim system settings
" PLUGINS SETTINGS HAS DEDICATED SECTION BELOW, DO NOT MIX

" When your .vimrc file is sourced twice, the autocommands will appear twice.
" To avoid this, put this command in your .vimrc file, before defining
" autocommands:
" Remove ALL autocommands for the current group.
autocmd!

" Enable syntax highlighting
syntax on

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
set completeopt+=popup

" Enable spell checking
set spell

set tabpagemax=100

" Set leader key
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader="\\"

" Display line numbers
set number

" Set relative numbers
set relativenumber

" Status line  ---------------------- {{{
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
" }}}

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
"
" While typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch

" Use 256 colors in terminal.
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" Set cursor shapes based on the mode
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[6 q"  " start insert mode, bar
    let &t_EI = "\<Esc>[2 q"  " end insert mode, block

	" Restore cursor shape resuming back to Vim
	let &t_TI .= "\e[2 q"	  " controls what happens when you exit
	let &t_TE .= "\e[4 q"	  " controls what happens when you start
endif

" Yank to system clipboard
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

set cpo-=<

" Look for a tags file in the directory of the current file, then upward until
" / and in the working directory, then upward until $HOME.
set tags=./tags;,tags;

" Plugin(s) settings  ---------------------- {{{
" This section is intentionally moved after initial settings defined above 
" because some of the plugins might alter those.
source $DOTDIR/.vim/plugins/papercolor.vim
source $DOTDIR/.vim/plugins/committia.vim
source $DOTDIR/.vim/plugins/ultisnips.vim
source $DOTDIR/.vim/plugins/vimhardtime.vim
source $DOTDIR/.vim/plugins/vimwiki.vim
source $DOTDIR/.vim/plugins/tmux.vim
source $DOTDIR/.vim/plugins/fzf.vim
source $DOTDIR/.vim/plugins/ycm.vim
source $DOTDIR/.vim/plugins/pomodoro.vim
" }}}


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

" Navigation between splits  ---------------------- {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
noremap <silent> <C-l> :call TmuxMove('l')<cr>
" }}}

" Move visual selection  ---------------------- {{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}

" Leader key mappings  ---------------------- {{{
" Quick write shortcut
nnoremap <Leader>w :w<CR>

" Same as fg but allows to open and edit non-existing file
noremap <leader>gf :e <cfile><cr>

" Tab for [t]abs
" It is is not possible to remap <TAB> without effecting <C-]>
nnoremap <Leader> <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
" }}}

" Vimrc related mappings  ---------------------- {{{
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source ~/.vimrc <CR>
" }}}

" Surround text object with X mappings  ---------------------- {{{
vnoremap <Leader>' <esc>`<i'<esc>`>la'
vnoremap <Leader>" <esc>`<i"<esc>`>la"
" }}}

" Disable arrow keys  ---------------------- {{{
" Use hlkj instead!
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
" }}}

" Session management  ---------------------- {{{
" ss for session save
exec 'nnoremap <Leader>ss :mks! ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'
" sr for session restore
exec 'nnoremap <Leader>sr :so ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'
" }}}

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
  autocmd!
  autocmd CmdwinEnter *
    \ echohl Todo | 
    \ echo 'You discovered the command-line window! You can close it with ":q".' |
    \ echohl None
augroup END

" TODO:

" Auto generate tags file on file write of *.c and *.h files
augroup tags_generate
	autocmd!
	autocmd BufWritePost *.go silent! !ctags --append=yes . &
augroup END

" Operator-pending mappings ---------------------- {{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

onoremap in{ :<c-u>normal! ?{vi{<cr>

augroup markdown_operators
  autocmd!

  autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\\|--\\+$\r:nohlsearch\rkvg_"<cr>
augroup END
" }}}

"###########################################################################
" General Autocmd's
"
" NOTE: File specific cmd's goes into: ~/.vim/ftplugin/{filetype}_whatever.vim
"###########################################################################

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
  autocmd!

  " Folding ---------------------- {{{
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=2
  autocmd FileType vim set foldcolumn=2
  " }}}
augroup END
" }}}

" TODO: make should run in backgroud?
function! GolangCiLint()
	let &makeprg=golangci-lint
    let &l:errformat="%f:%l:%c:\ %m,%f:%l:%c\ %#%m"
	make lint | copen
endfunction

" Learning vim hard way
nnoremap <leader>jr :set makeprg=golangci-lint <CR> :set errformat='' <CR>:make \| redraw! <CR> :copen<CR>

" Go file type settings ---------------------- {{{
augroup filetype_go
  autocmd!
  " Calling GoFmt will have such side effects such as a) loosing opened folds and b) screwing jump list
  autocmd FileType go nnoremap <buffer> <localleader>f :silent! GoFmt <cr> " GoFmt is a plugin function

  " Syntax folding ---------------------- {{{
  " Folds are defined by syntax highlighting
  autocmd FileType go set foldmethod=syntax
  
  " By default set fold level start 1 just to be awere such functionallity
  " and employ it in daily work
  autocmd FileType go set foldlevelstart=1
  " :autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
  
  " Display a small column to visually indicate folds
  autocmd FileType go set foldcolumn=2
" }}}
augroup END

"###########################################################################

" Abbreviations ---------------------- {{{
iabbrev @@ hi@deividaspetraitis.lt
iabbrev ccopy Copyright 2013 Deividas Petraitis, all rights reserved.
iabbrev ssig -- <cr>Deividas Petraitis<cr>hi@deividaspetraitis.lt
" }}}

function Meow()
  echom "Meow!"
endfunction

function GetMeow()
  return "Meow!"
endfunction

function DisplayName(name)
  echom "Hello! My name is:"
  echom a:name
endfunction

function UnscopedDisplayName(name)
  echom "Hello! My name is:"
  echom name
endfunction

function Varg(...)
  echom a:0
  echom a:1
  echom a:2
  echo a:000
endfunction

function Varg2(foo, ...)
  echom a:foo
  echo a:0
  echo a:1
  echo a:000
endfunction

function Assign(foo)
  let a:foo = "Nope"
  echo a:foo
endfunction

function AssignGood(foo)
  let foo_tmp = a:foo
  let foo_tmp = "Yep"
  echom foo_tmp
endfunction

function Varg3(first, second = "default", ...)
  echom a:first
  echom a:second
endfunction

" comment
function Comment(char)
  :execute "normal! ^\<s-v>I" . a:char
endfunction

function Uncomment(char)
  ":s "/" . a:char . "//"
  " /^\="// 
  " ^\s\="
  " ^\s\{0,}"
  " ^\s*"
  echom "uncomment"
"  :execute "su" . "/^\s*" . a:char . "//"
"  :execute "su" . "/^\s*\/\//"
  execute "%s/" . a:char . "/" . "" . "/"
endfunction
