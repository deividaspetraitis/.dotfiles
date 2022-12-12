" Vimwiki settings
" --------------------------------------------------------------------------

" :help vimwiki-global-mappings
" :help vimwiki-local-mappings
" most of these mappings are random and not in use
" I do not like how these conflicts with my own mappings
nmap <leader>vw <Plug>VimwikiIndex
nmap <leader>vwt <Plug>VimwikiTabIndex
nmap <leader>vws <Plug>VimwikiUISelect
nmap <leader>vwi <Plug>VimwikiDiaryIndex
nmap <leader>vwww <Plug>VimwikiMakeDiaryNote
nmap <leader>vd <Plug>VimwikiDiaryGenerateLinks
nmap <leader>va <Plug>VimwikiTabMakeDiaryNote
nmap <leader>vb <Plug>VimwikiMakeYesterdayDiaryNote
nmap <leader>vc <Plug>VimwikiMakeTomorrowDiaryNote

" lists settings
let g:vimwiki_list = [{
	\ 'path': '~/vimwiki/',
	\ 'custom_wiki2html': '~/.dotfiles/vimwiki/pandoc_md2html.py',
    \ 'syntax': 'markdown', 'ext': '.md'
	\ }]


