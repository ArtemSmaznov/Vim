let g:which_key_max_size = 0
let g:which_key_flatten = 1
let g:which_key_vertical = 0
let g:which_key_position = 'botright'
let g:which_key_use_floating_win = 0
let g:which_key_fallback_to_native_key=1
let g:which_key_display_names = { ' ': 'SPC', '<CR>': 'RET', '<TAB>': 'TAB', '<ESC>': 'ESC' }
" let g:which_key_display_names = { ' ': '⎵', '<CR>': '↵', '<TAB>': '⇆' }
let g:which_key_centered = 0
let g:which_key_default_group_name = '+prefix'

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" ░█▀▀░█░░░█▀█░█▀▄░█▀█░█░░
" ░█░█░█░░░█░█░█▀▄░█▀█░█░░
" ░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀░▀░▀▀▀

" register dictionary for the <Space>-prefix
call which_key#register(' ', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Define prefix dictionary
let g:which_key_map =  {}

let g:which_key_map.b = { 'name' : '+buffer' }
let g:which_key_map.c = { 'name' : '+code' }
let g:which_key_map.f = { 'name' : '+file' }
let g:which_key_map.h = { 'name' : '+help' }
let g:which_key_map.i = { 'name' : '+insert' }
let g:which_key_map.p = { 'name' : '+popup' }
let g:which_key_map.q = { 'name' : '+quit/session' }
let g:which_key_map.s = { 'name' : '+search' }
let g:which_key_map.t = { 'name' : '+toggle' }

" ░█░░░█▀█░█▀▀░█▀█░█░░
" ░█░░░█░█░█░░░█▀█░█░░
" ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

call which_key#register(' m', "g:local_key_map")
nnoremap <silent> <localleader> :<c-u>WhichKey ' m'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ' m'<CR>

" " Define prefix dictionary
let g:local_key_map = {}


" ░█▀█░▀█▀░█░█░█▀▀░█▀▄
" ░█░█░░█░░█▀█░█▀▀░█▀▄
" ░▀▀▀░░▀░░▀░▀░▀▀▀░▀░▀

" register dictionary for the []-prefix
call which_key#register('[', "g:bracket_map")
call which_key#register(']', "g:bracket_map")
nnoremap <silent> [ :<c-u>WhichKey '['<CR>
nnoremap <silent> ] :<c-u>WhichKey ']'<CR>

" Define prefix dictionary
let g:bracket_map = {}

let g:bracket_map['['] = 'Move around functions'
let g:bracket_map[']'] = 'Move around functions'
let g:bracket_map['"'] = 'Move around comments'
let g:bracket_map['m'] = 'Move around'
let g:bracket_map['M'] = 'Move around'
