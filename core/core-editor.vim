iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set hlsearch   " Highlight search results
set incsearch  " Makes search act like search in modern browsers
set magic      " Regular expressions in search

if has('wildmenu')
  set wildmenu   " Turn on the Wild menu
endif

set nobackup              " This is recommended by coc
set nowritebackup         " This is recommended by coc
set noswapfile

set history=500       " Sets how many lines of history VIM has to remember

if has('persistent_undo')
  try
    call EnsureDir(g:undodir)
    set undodir=g:undodir
    set undofile
  catch
  endtry
endif

set clipboard=unnamed " Copy paste between vim and everything else

set encoding=utf-8   " Set utf8 as standard encoding
set ffs=unix,dos,mac " Use Unix as the standard file type

" Set to auto read when a file is changed from the outside
set autoread
" au FocusGained,BufEnter * checktime
au FocusGained * checktime

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes
if has('autocmd')
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

set hidden     " A buffer becomes hidden when it is abandoned

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

call EnsureDir(g:workspaces)

if has('viminfo')
  if filereadable(expand("$HOME/.viminfo"))
    silent execute $"!mv $HOME/.viminfo {viminfo}"
  endif
  
  set viminfo+=f1
  execute $"set viminfo+=n{viminfo}"
endif

if has('mksession')
  " set sessionoptions-=tabpages
  set sessionoptions-=help
  set sessionoptions-=options
endif

if has('mksession') && has('autocmd')
  autocmd! VimLeave * silent call QuickSaveSession()
endif

if has('wildignore')
  set wildignore=*.o,*~,*.pyc
  if has('win16') || has('win32')
    set wildignore+=.git\*
    set wildignore+=.hg\*
    set wildignore+=.svn\*
    set wildignore+=**\node_modules\**
  else
    set wildignore+=*/.git/*
    set wildignore+=*/.hg/*
    set wildignore+=*/.svn/*
    set wildignore+=**/node_modules/**
    set wildignore+=*/.DS_Store
  endif
endif

set tabstop=2     " Number of spaces to insert for a tab
set shiftwidth=2  " Change the number of spaces for indentation
set smarttab      " Makes tabbing smarter will realize you have 2 vs 4
set expandtab     " Converts tabs to spaces
set autoindent    " Good auto indent

if has('smartindent')
  set smartindent " Makes indenting smart
endif

" Linebreak on 500 characters
if has('linebreak')
  set linebreak " Visual only line break
endif
" set textwidth=500

set wrap        " Wrap lines

set nrformats=bin,hex

set mouse=a

if !has('nvim')
  set ttymouse=sgr
  set termwinsize=15x0 " Set size for terminal
endif

set lazyredraw " Don't redraw while executing macros (good performance config)
set showmatch  " Show matching brackets when text indicator is over them
set mat=2      " How many tenths of a second to blink when matching brackets

set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has('gui_macvim') && has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

if has('syntax')
  set spelllang=en_us
endif
