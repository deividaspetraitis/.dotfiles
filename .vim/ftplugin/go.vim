setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Spelling settings
set spelllang=en_us
set spellfile=~/.vim/spell/en_us.utf-8.add
set spell

" Set go fmt
" augroup gofmt
"   autocmd!
"   autocmd BufWritePre *.go :GoFmt
" augroup END 

" Move around functions
" See: https://github.com/vim/vim/blob/master/runtime/ftplugin/vim.vim
nnoremap <silent><buffer> [[ m':call search('^\s*\(fu\%[nction]\\|def\)\>', "bW")<CR>
vnoremap <silent><buffer> [[ m':<C-U>exe "normal! gv"<Bar>call search('^\s*\(fu\%[nction]\\|def\)\>', "bW")<CR>
nnoremap <silent><buffer> ]] m':call search('^\s*\(fu\%[nction]\\|def\)\>', "W")<CR>
vnoremap <silent><buffer> ]] m':<C-U>exe "normal! gv"<Bar>call search('^\s*\(fu\%[nction]\\|def\)\>', "W")<CR>

" YCM mappings, we want to make it to work close as possible to the defaults
nnoremap gD :YcmCompleter GoToDeclaration <CR>
nnoremap g] :YcmCompleter GoToReferences <CR>
nnoremap <leader>gi :YcmCompleter GoToImplementation <CR>
nnoremap <C-]> :YcmCompleter GoToDefinition <CR>
nnoremap <C-w>} :YcmCompleter GetDoc <CR>
