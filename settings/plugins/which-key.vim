let g:which_key_max_size = 0
let g:which_key_flatten = 1
let g:which_key_vertical = 0
let g:which_key_position = 'botright'
let g:which_key_use_floating_win = 0
let g:which_key_fallback_to_native_key=1
let g:which_key_display_names = { ' ': '⎵', '<CR>': '↵', '<TAB>': '⇆' }
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

let g:which_key_map['<'] = 'Switch buffer' 
let g:which_key_map['<Esc>'] = 'Clear search highlights' 
let g:which_key_map['`'] = 'Switch to last buffer' 

let g:which_key_map.b = { 'name' : '+buffer' }
let g:which_key_map.b['['] = 'Previous buffer'
let g:which_key_map.b[']'] = 'Next buffer'
let g:which_key_map.b['b'] = 'Switch buffer' 
let g:which_key_map.b['d'] = 'Kill buffer' 
let g:which_key_map.b['k'] = 'Kill buffer'
let g:which_key_map.b['K'] = 'Kill all buffers' 
let g:which_key_map.b['n'] = 'Next buffer' 
let g:which_key_map.b['N'] = 'New empty tab' 
" let g:which_key_map.b['O'] = 'Kill other buffers' 
let g:which_key_map.b['p'] = 'Previous buffer' 
let g:which_key_map.b['l'] = 'Switch to last buffer' 
let g:which_key_map.b['s'] = 'Save buffer' 
let g:which_key_map.b['S'] = 'Save all buffers' 
let g:which_key_map.b['u'] = 'Save buffer as root' 

let g:which_key_map.c = { 'name' : '+code' }

let g:which_key_map.f = { 'name' : '+file' }
let g:which_key_map.f.e = { 'name' : '+edit-config' }
let g:which_key_map.f.e.q = { 'name' : '+qtile' }
let g:which_key_map.f.e.d = { 'name' : '+dotfiles' }
let g:which_key_map.f.e.v = { 'name' : '+vim' }
let g:which_key_map.f['c'] = 'CD to current directory' 
let g:which_key_map.f['s'] = 'Save file' 
let g:which_key_map.f['S'] = 'Save as...' 
let g:which_key_map.f['v'] = 'Grep' 

let g:which_key_map.h = { 'name' : '+help' }
let g:which_key_map.h.r      = { 'name' : '+reload' }
let g:which_key_map.h.r['e'] = 'Reload env' 
let g:which_key_map.h.r['p'] = 'Reload plugins' 
let g:which_key_map.h.r['r'] = 'Reload' 

let g:which_key_map.i = { 'name' : '+insert' }
let g:which_key_map.i['t'] = 'Insert Toilet title' 

let g:which_key_map.p = { 'name' : '+popup' }

let g:which_key_map.q = { 'name' : '+quit/session' }
let g:which_key_map.q['l'] = 'Quick load session' 
let g:which_key_map.q['L'] = 'Load session from file' 
let g:which_key_map.q['q'] = 'Quit Vim' 
let g:which_key_map.q['Q'] = 'Quit Vim without saving' 
let g:which_key_map.q['s'] = 'Quick save current session' 
let g:which_key_map.q['S'] = 'Save session to file' 

let g:which_key_map.s = { 'name' : '+search' }

let g:which_key_map.t = { 'name' : '+toggle' }
let g:which_key_map.t['p'] = 'Paste mode' 
let g:which_key_map.t['s'] = 'Spell check' 

let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w['+'] = 'Increase window height' 
let g:which_key_map.w['-'] = 'Decrease window height' 
let g:which_key_map.w['<'] = 'Decrease window width' 
let g:which_key_map.w['='] = 'Balance windows' 
let g:which_key_map.w['>'] = 'Increase window width' 
let g:which_key_map.w['_'] = 'Set window height' 
let g:which_key_map.w['`'] = 'Open a terminal in a split' 
let g:which_key_map.w['b'] = 'Bottom-right window' 
let g:which_key_map.w['c'] = 'Close window' 
let g:which_key_map.w['d'] = 'Close window' 
let g:which_key_map.w['h'] = 'Left window' 
let g:which_key_map.w['H'] = 'Move window left' 
let g:which_key_map.w['j'] = 'Down window' 
let g:which_key_map.w['J'] = 'Move window down' 
let g:which_key_map.w['k'] = 'Up window' 
let g:which_key_map.w['K'] = 'Move window up' 
let g:which_key_map.w['l'] = 'Right window' 
let g:which_key_map.w['L'] = 'Move window right' 
let g:which_key_map.w['n'] = 'New window' 
let g:which_key_map.w['o'] = 'Enlargen window' 
let g:which_key_map.w['p'] = 'Last window' 
let g:which_key_map.w['q'] = 'Quit window' 
let g:which_key_map.w['r'] = 'Rotate windows downwards' 
let g:which_key_map.w['R'] = 'Rotate windows upwards' 
let g:which_key_map.w['s'] = 'Split window' 
let g:which_key_map.w['S'] = 'Split and follow window' 
let g:which_key_map.w['t'] = 'Top-left window' 
let g:which_key_map.w['T'] = 'Tear off window' 
let g:which_key_map.w['v'] = 'VSplit window' 
let g:which_key_map.w['V'] = 'VSplit and follow window' 
let g:which_key_map.w['w'] = 'Next window' 
let g:which_key_map.w['W'] = 'Previous window' 
let g:which_key_map.w['|'] = 'Set window width' 


" ░█░░░█▀█░█▀▀░█▀█░█░░
" ░█░░░█░█░█░░░█▀█░█░░
" ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

" register dictionary for the ,-prefix
call which_key#register(',', "g:local_key_map")
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

" Define prefix dictionary
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
