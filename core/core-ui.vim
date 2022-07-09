set background=dark
colorscheme gruvbox8

" Set font according to system
if has('mac') || has('macunix')
  set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has('win16') || has('win32')
  set gfn=Hack\ Nerd\ Font\ Mono:h10,Source\ Code\ Pro:h12,IBM\ Plex\ Mono:h14,Consolas:h11
elseif has('gui_gtk2')
  set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has('linux')
  set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has('unix')
  set gfn=Monospace\ 11
endif

set foldcolumn=1     " Add a bit extra margin to the left
set signcolumn=yes   " Always show the signcolumn, otherwise it would shift the text each time
set ruler            " Always show current position
set number           " Show line numbers
set relativenumber   " Make line numbers relative
set cursorline       " Enable highlighting of the current line
set showtabline=2    " Always show tabs
set laststatus=2     " Always display the status line
set showcmd          " Show commands
set cmdheight=1      " Height of the command bar
set splitbelow       " Horizontal splits will automatically be below
set splitright       " Vertical splits will automatically be to the right

set fillchars+=vert:\

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

if exists("$TMUX") 
  if has('nvim')
    set termguicolors
  else
    set term=screen-256color 
  endif
endif

if has('gui_running')
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif
