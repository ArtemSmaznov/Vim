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
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
xmap <leader>x  <Plug>(coc-convert-snippet)
let g:which_key_map['x'] = 'Convert to snippet' 

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
let g:squre_bracket_map.g = 'Coc Problem'

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gR <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <leader>hk :call <SID>show_documentation()<CR>
let g:which_key_map.h['k'] = 'Search Documentation' 

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'vertical h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
let g:which_key_map.c['f'] = 'Format' 

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>c<space> <Plug>(coc-codeaction)
let g:which_key_map.c[' '] = 'Code action' 

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>cv <Plug>(coc-codeaction-selected)
nmap <leader>cv <Plug>(coc-codeaction-selected)
let g:which_key_map.c['v'] = 'Code action selected' 

" Fix autofix problem of current line
nmap <leader>ca  <Plug>(coc-fix-current)
let g:which_key_map.c['a'] = 'Fix current' 

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-s> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList

" Show all diagnostics
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
let g:which_key_map.c['d'] = 'Diagnostics' 

" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
let g:which_key_map.c['e'] = 'Extensions' 

" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
let g:which_key_map.c['c'] = 'Commands' 

" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
let g:which_key_map.c['o'] = 'Outline' 

" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
let g:which_key_map.c['s'] = 'Symbols' 

nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
let g:which_key_map.c['j'] = 'Default action for next item' 

nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
let g:which_key_map.c['k'] = 'Default action for previous item' 

nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
let g:which_key_map.c['p'] = 'Resume latest coc list' 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc-Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <leader><Tab> :CocCommand explorer<CR>
nmap <leader>tn :CocCommand explorer<CR>
let g:which_key_map.t['n'] = 'File tree' 
" let g:which_key_map['<Tab>'] = 'File tree' 

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
