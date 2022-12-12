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

