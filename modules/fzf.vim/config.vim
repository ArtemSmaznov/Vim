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

call EnsureDir($"{vim_dir}/.local/cache")
let g:fzf_history_dir = $"{vim_dir}/.local/cache/fzf-history"

let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'down': '40%' }

let $FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/'"

" For full list of options see `man fzf`
let $FZF_DEFAULT_OPTS = '
      \ --layout=reverse
      \ --info=inline
      \ --cycle
      \ --filepath-word
      \ --marker=*'

" Customize fzf colors to match the color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl':      ['fg', 'Search'],
      \ 'hl+':     ['fg', 'Search'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Operator'],
      \ 'info':    ['fg', 'FoldColumn'],
      \ 'header':  ['fg', 'Comment'],
      \ 'pointer': ['fg', 'String'],
      \ 'marker':  ['fg', 'Question'],
      \ 'spinner': ['fg', 'Label']
      \ }

" Redefining default functions

" Files
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
