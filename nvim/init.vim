" Use Vim settings, rather than Vi settings
set nocompatible
filetype off

" For some reason it solves issues with Vundle Plugin Manager
set shell=/bin/bash

" .vim contains ftype and other files
set rtp+=~/.dotfiles/nvim/.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

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

" Telescope.nvim is a highly extendable fuzzy finder over lists.
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-fzy-native.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

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

" Vim-Go Plugin
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_extra_types = 1
" 
" let g:go_highlight_structs = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" 
" let g:go_def_mode = 'gopls'
" let g:go_debug=['lsp']

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

"###########################################################################
" Plugin(s) settings

" Papercolor theme settings
set t_Co=256   " This is may or may not needed.
set background=light
colorscheme PaperColor

" NERDTree plugin specific commands
" Toggle ON/OFF tree F6
nmap <F6> :NERDTreeToggle<CR>

" Telescope plugin settings

" Using lua functions
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"###########################################################################
" Mappings

" Show your next matched string at the center of the screen when you press n 
" or N, so it is easier to identify your location in the file
nnoremap n nzz 
nnoremap N Nzz

" Navigation between splits, instead of CTRL-W then J, it’s just CTRL-J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"###########################################################################
" Custom Vim mappings using the leader key
" Defining a leader key is one of the best things you can do to boost your productivity in Vim.
" You can define leader shortcuts for your most used commands.

" Quick write shortcut
nnoremap <Leader>w :w<CR>

" Quick Find of the word under the cursor
" ! - prevents jumping to the first match
nnoremap <Leader>F :grep! -rn . -e '<C-R><C-W>'<CR><CR> \| :copen <CR>

" TODO:
" Windows management
nnoremap <Leader>\| <C-W>v
nnoremap <Leader>- <C-W>s

nnoremap <Leader>r :source ~/.vimrc <CR>

" Vim sessions management
exec 'nnoremap <Leader>ss :mks! ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'

"###########################################################################
" General Autocmd's
"
" NOTE: File specific cmd's goes into: ~/.vim/ftplugin/{filetype}_whatever.vim
"###########################################################################
" Plugin(s) settings

" UltiSnips configuration
" -------------------------------------------------------------------------
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim HardTime
" -------------------------------------------------------------------------
" Turn on enjoyment of Vim experience
let g:hardtime_default_on = 1

" Tmux + Vim configuration
function! TmuxMove(direction)
  let wnr = winnr()
  silent! execute 'wincmd ' . a:direction
  " If the winnr is still the same after we moved,
  " it is the last pane
	if wnr == winnr()
	  call system('tmux select-pane -' .  tr(a:direction, 'phjkl', 'lLDUR'))
	end
endfunction

nnoremap <silent> <C-Left> :call TmuxMove('h')<cr>
nnoremap <silent> <C-Down> :call TmuxMove('j')<cr>
nnoremap <silent> <C-Up> :call TmuxMove('k')<cr>
nnoremap <silent> <C-Right> :call TmuxMove('l')<cr>

nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
noremap <silent> <C-l> :call TmuxMove('l')<cr>
