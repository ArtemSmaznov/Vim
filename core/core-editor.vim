iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set hlsearch   " Highlight search results
set incsearch  " Makes search act like search in modern browsers
set magic      " For regular expressions turn magic on

if has('wildmenu')
  set wildmenu   " Turn on the Wild menu
endif

set nobackup              " This is recommended by coc
set nowritebackup         " This is recommended by coc
set noswapfile

set history=500       " Sets how many lines of history VIM has to remember
set clipboard=unnamed " Copy paste between vim and everything else

" Set to auto read when a file is changed from the outside
set autoread
" au FocusGained,BufEnter * checktime
au FocusGained * checktime

" Turn persistent undo on - you can undo even when you close a buffer/VIM
if has('persistent_undo')
  try
    set undodir=$HOME/.vim/.local/etc/transient/undodir
    set undofile
  catch
  endtry
endif

" Location for cache files for NetRW
let g:netrw_home="$HOME/.vim/.local/cache"

if has('viminfo')
  set viminfo+=f1
  set viminfo+=n~/.vim/.local/etc/workspaces/_viminfo
endif

if has('mksession')
  " set sessionoptions-=tabpages
  set sessionoptions-=help
  set sessionoptions-=options
endif

if has('mksession')
  let autosave_file="$HOME/.vim/.local/etc/workspaces/autosave"

  function! SaveSession( backups )
    let backups = a:backups

    while backups > 0
      if backups != 1
        if filereadable(expand($"{g:autosave_file}{backups-1}"))
          execute $"!mv {g:autosave_file}{backups-1} {g:autosave_file}{backups}"
        endif
      else
        if filereadable(expand($"{g:autosave_file}"))
          execute $"!mv {g:autosave_file} {g:autosave_file}{backups}"
        endif
      endif
      let backups -= 1
    endwhile

    execute 'mksession! ' . g:autosave_file
  endfunction

  if has('autocmd')
    autocmd! VimLeave * silent call SaveSession(3)
  endif
endif

if has('wildignore')
  set wildignore=*.o,*~,*.pyc
  if has('win16') || has('win32')
    set wildignore+=.git\*,.hg\*,.svn\*,**\node_modules\**
  else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,**/node_modules/**,*/.DS_Store
  endif
endif

set tabstop=2             " Insert 2 spaces for a tab
set shiftwidth=2          " Change the number of spaces for indentation
set smarttab              " Makes tabbing smarter will realize you have 2 vs 4
set expandtab             " Converts tabs to spaces

" Linebreak on 500 characters
set linebreak
" set textwidth=500

set autoindent  " Good auto indent
if has('smartindent')
  set smartindent " Makes indenting smart
endif

set wrap        " Wrap lines

" CTRL+A/X will only treat numbers as decimals or hex
set nrformats=bin,hex

set hidden     " A buffer becomes hidden when it is abandoned

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has('autocmd')
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

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

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set spelllang=en_us
