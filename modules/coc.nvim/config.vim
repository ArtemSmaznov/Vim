" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc config
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-explorer',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-pyright',
      \ 'coc-lua',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-vimlsp',
      \ 'coc-sh',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-xml',
      \ 'coc-markdownlint',
      \ 'coc-cmake',
      \ ]

" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
