command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

command! Bclose call <SID>BufcloseCloseIt()

function! ClearAll()
  call feedkeys( ":nohlsearch\<CR>" )
  call feedkeys( "\<Plug>(ExchangeClear)" )
endfunction

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

function! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunction

function! EnsureDir( dir )
  if !isdirectory(expand(a:dir))
    silent call mkdir(expand(a:dir), 'p')
  endif
endfunction

function! QuickSaveSession()
  let backups = 3

  while backups > 0
    let f_from = expand($"{g:autosave}{backups-1}")
    if backups == 1
      let f_from = expand($"{g:autosave}")
    endif

    call rename(f_from, expand($"{g:autosave}{backups}"))

    let backups -= 1
  endwhile

  execute 'mksession! ' . g:autosave
endfunction

function! QuickLoadSession()
  execute $"source {g:autosave}"
endfunction

function! SaveWorkspace()
  let ws = input("Workspace to save: ")
  if ws != ''
    execute $"mksession! {g:workspaces}/{ws}"
  endif
endfunction

function! LoadWorkspace()
  if has_key(g:plugs, 'fzf')
    call fzf#run({
      \ 'dir': g:workspaces,
      \ 'source': $"ls {g:workspaces} | grep -ve autosave -e viminfo || exit 0",
      \ 'sink': "source" 
      \ })
  else
    call feedkeys($":source {g:workspaces}/")
  endif
endfunction

function! DeleteWorkspace()
  if has_key(g:plugs, 'fzf')
    call fzf#run({
      \ 'dir': g:workspaces,
      \ 'source': $"ls {g:workspaces} | grep -ve autosave -e viminfo || exit 0",
      \ 'sink': function('delete')
      \ })
  endif
endfunction

function! ToggleOption( opt, mode )
  execute $"setlocal {a:opt}!"
  execute $"echo '{a:mode} mode' (&{a:opt} ? 'enabled' : 'disabled') 'in current buffer'"
endfunction

function! ToggleFillColumn()
  execute 'set colorcolumn=' . (&colorcolumn == '' ? '-0' : '')
  execute $"echo 'Global Dispaly-Fill-Column-Indicator mode' (&colorcolumn != '' ? 'enabled' : 'disabled')"
endfunction

function! Toggle_Rainbow()
  if !exists('w:match_list') || empty(w:match_list)
    ColorHighlight
    echo 'Rainbow mode enabled in current buffer'
  else
    ColorClear
    echo 'Rainbow mode disabled in current buffer'
  endif
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

function! RevealInFiles()
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

function! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction
