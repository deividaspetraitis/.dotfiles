setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Spelling settings
setlocal spelllang=en_us
setlocal spellfile=~/.vim/spell/en_us.utf-8.add
setlocal spell

" Filter 
setlocal equalprg=gofmt

" Move around functions
" See: https://github.com/vim/vim/blob/master/runtime/ftplugin/vim.vim
nnoremap <silent><buffer> [[ m':call search('^\s*\(fu\%[nction]\\|def\)\>', "bW")<CR>
vnoremap <silent><buffer> [[ m':<C-U>exe "normal! gv"<Bar>call search('^\s*\(fu\%[nction]\\|def\)\>', "bW")<CR>
nnoremap <silent><buffer> ]] m':call search('^\s*\(fu\%[nction]\\|def\)\>', "W")<CR>
vnoremap <silent><buffer> ]] m':<C-U>exe "normal! gv"<Bar>call search('^\s*\(fu\%[nction]\\|def\)\>', "W")<CR>

" YCM mappings, we want to make it to work close as possible to the defaults

nnoremap <silent><buffer> gD :YcmCompleter GoToDeclaration <CR>
nnoremap <silent><buffer> g] :YcmCompleter GoToReferences <CR>
nnoremap <silent><buffer> <leader>gi :YcmCompleter GoToImplementation <CR>
nnoremap <silent><buffer> <C-]> :YcmCompleter GoToDefinition <CR>
nnoremap <silent><buffer> <C-w>} :YcmCompleter GetDoc <CR>


nnoremap <silent><buffer> <leader>l :Lint() <CR>
