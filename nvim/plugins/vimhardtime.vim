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

