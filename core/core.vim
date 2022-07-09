filetype plugin on
filetype indent on

syntax enable

let g:mapleader = " "
let g:maplocalleader = " m"

source $HOME/.vim/packages.vim
source $HOME/.vim/modules/source.vim
source $HOME/.vim/core/core-editor.vim
source $HOME/.vim/core/core-ui.vim
source $HOME/.vim/core/core-keybindings.vim

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

function! DeleteTillSlash()
  let g:cmd = getcmdline()

  if has('win16') || has('win32')
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  endif

  if g:cmd == g:cmd_edited
    if has('win16') || has('win32')
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    endif
  endif   

  return g:cmd_edited
endfunction

function! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunction

function! AutoSaveSession( backups )
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

function! ClearAll()
  call feedkeys( ":nohlsearch\<CR>" )
  call feedkeys( "\<Plug>(ExchangeClear)" )
endfunction

function! ToggleOption( opt, mode )
  execute $"setlocal {a:opt}!"
  execute $"echo '{a:mode} mode' (&{a:opt} ? 'enabled' : 'disabled') 'in current buffer'"
endfunction

function! CycleLineNumbers()
  if &number && &relativenumber
    setlocal norelativenumber
    echo 'Switched to normal line numbers'
  elseif &number && ! &relativenumber
    setlocal nonumber
    echo 'Switched to disabled line numbers'
  else
    setlocal number
    setlocal relativenumber
    echo 'Switched to relative line numbers'
  endif
endfunction

function! ToggleFillColumn()
  execute 'set colorcolumn=' . (&colorcolumn == '' ? '-0' : '')
  execute 'echo ' . (&colorcolumn == '' ? '"Global Dispaly-Fill-Column-Indicator mode disabled"' : '"Global Dispaly-Fill-Column-Indicator mode enabled"')
endfunction

if has_key(plugs, 'Colorizer')
  function! Toggle_Rainbow()
    if !exists('w:match_list') || empty(w:match_list)
      echo 'Rainbow mode enabled in current buffer'
      ColorHighlight
    else
      echo 'Rainbow mode disabled in current buffer'
      ColorClear
    endif
  endfunction
endif

function! Reveal_In_Files()
  if has('linux')
    let opencmd = '!xdg-open '
  elseif has('mac') || has('macunix')
    let opencmd = '!open '
  elseif has('win16') || has('win32')
    let opencmd = '!explorer.exe '
    " let opencmd = '!start explorer.exe /select,'
  endif

  silent execute opencmd . expand('%:p:h')
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'vertical h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
