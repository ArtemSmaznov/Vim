" Source - https://www.chrisatmachine.com/Neovim/08-fzf/
"
" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


" <leader> section
nnoremap <leader>/ :Rg<CR>

let g:which_key_map['/'] = 'Search project' 


" +find section
map <leader>ff :Files<CR>
map <leader>fr :History<CR>

let g:which_key_map.f['f'] = 'Find file' 
let g:which_key_map.f['r'] = 'Recent files' 


" +help section
map <leader>hb :Maps<CR>
nnoremap <leader>hh :Helptags<CR>
nnoremap <leader>ht :Colors<CR>

let g:which_key_map.h['b']   = 'Bindings' 
let g:which_key_map.h['h']   = 'Search Help' 
let g:which_key_map.h['t']   = 'Load theme' 


" +popup section
nnoremap <leader>p' :Marks<CR>
nnoremap <leader>p/ :History/<CR>
nnoremap <leader>p: :History:<CR>
map <leader>pb :Buffers<CR>
map <leader>pc :Commands<CR>
map <leader>pf :Filetypes<CR>
map <leader>pw :Windows<CR>

let g:which_key_map.p["'"] = 'Search marks' 
let g:which_key_map.p['/'] = 'Search history' 
let g:which_key_map.p[':'] = 'Commands history' 
let g:which_key_map.p['b'] = 'Switch buffer' 
let g:which_key_map.p['c'] = 'Search all commands' 
let g:which_key_map.p['f'] = 'Switch filetype' 
let g:which_key_map.p['w'] = 'Switch window' 


" +search section
map <leader>sb :BLines<CR>
map <leader>sB :Lines<CR>
nnoremap <leader>sp :Rg<CR>
nnoremap <leader>st :BTags<CR>
nnoremap <leader>sT :Tags<CR>

let g:which_key_map.s['b'] = 'Search buffer' 
let g:which_key_map.s['B'] = 'Search all open buffers' 
let g:which_key_map.s['p'] = 'Search project' 
let g:which_key_map.s['t'] = 'Search Tags in buffer' 
let g:which_key_map.s['T'] = 'Search Tags in all buffers' 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--info=inline'
" let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
