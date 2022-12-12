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
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'
Plugin 'nvim-telescope/telescope-fzy-native.nvim'

" Focus on the task and temporarily disable the distraction elements in Neovim
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim' " dim all lines except the current line when turned on.

" More Pleasant Editing on Commit Message
Plugin 'rhysd/committia.vim'

" VimWiki is a personal wiki for Vim
Plugin 'vimwiki/vimwiki'

" Fugitive is the premier Vim plugin for Git
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"###########################################################################
" Plugin(s) settings

source $DOTDIR/.vim/plugins/papercolor.vim
source $DOTDIR/.vim/plugins/committia.vim
source $DOTDIR/.vim/plugins/ultisnips.vim
source $DOTDIR/.vim/plugins/vimhardtime.vim
source $DOTDIR/.vim/plugins/vimwiki.vim
source $DOTDIR/.vim/plugins/tmux.vim
