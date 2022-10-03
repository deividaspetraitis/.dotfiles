source $DOTDIR/nvim/settings.vim

source $DOTDIR/nvim/plugins/plugins.vim
lua << EOF
	require("plugins")
EOF
"
"###########################################################################
" Mappings

" NERDTree plugin specific commands
" Toggle ON/OFF tree F6
nmap <F6> :NERDTreeToggle<CR>

" Telescope plugin settings
" Using lua functions
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

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

" Window splitting
nnoremap <Leader>l :set splitright<CR> <C-W>v
nnoremap <Leader>h :set nosplitright<CR> <C-W>v
nnoremap <Leader>j :set splitbelow<CR> <C-W>s
nnoremap <Leader>k :set nosplitbelow<CR> <C-W>s

nnoremap <Leader>r :source $DOTDIR/nvim/init.vim <CR>

" Vim sessions management
exec 'nnoremap <Leader>ss :mks! ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ~/.vim/sessions/*.vim<C-D><BS><BS><BS><BS><BS>'

nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
noremap <silent> <C-l> :call TmuxMove('l')<cr>

"###########################################################################
" General Autocmd's
"
" NOTE: File specific cmd's goes into: ~/.vim/ftplugin/{filetype}_whatever.vim
"###########################################################################
" Plugin(s) settings
