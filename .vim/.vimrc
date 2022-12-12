source $DOTDIR/.vim/settings.vim

" Plugin(s) settings
source $DOTDIR/.vim/plugins/plugins.vim
"
"###########################################################################
" Mappings

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

nnoremap <Leader>r :source .vimrc <CR>

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
