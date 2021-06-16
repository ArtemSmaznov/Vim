let g:which_key_max_size = 0
let g:which_key_flatten = 1
let g:which_key_vertical = 0
let g:which_key_position = 'botright'
let g:which_key_use_floating_win = 0
let g:which_key_fallback_to_native_key=1
let g:which_key_display_names = { ' ': '⎵', '<CR>': '↵', '<TAB>': '⇆' }
let g:which_key_centered = 0
let g:which_key_default_group_name = '+group'

" register dictionary for the <Space>-prefix
call which_key#register(' ', "g:leader_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>


" ░█▀▀░█░░░█▀█░█▀▄░█▀█░█░░
" ░█░█░█░░░█░█░█▀▄░█▀█░█░░
" ░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀░▀░▀▀▀

" Define prefix dictionary
let g:leader_map =  {}

let g:leader_map[' '] = 'Hide search highlights' 
let g:leader_map['<'] = 'Switch buffer' 
let g:leader_map['`'] = 'Terminal' 

let g:leader_map.b = { 'name' : '+buffer' }
let g:leader_map.b['['] = 'Previous buffer'
let g:leader_map.b[']'] = 'Next buffer'
let g:leader_map.b['d'] = 'Kill buffer' 
let g:leader_map.b['k'] = 'Kill buffer'
let g:leader_map.b['K'] = 'Kill all buffers' 
let g:leader_map.b['n'] = 'Next buffer' 
let g:leader_map.b['N'] = 'New empty tab' 
let g:leader_map.b['p'] = 'Previous buffer' 
let g:leader_map.b['l'] = 'Switch buffers' 

let g:leader_map.c = { 'name' : '+code' }

let g:leader_map.f = { 'name' : '+file' }
let g:leader_map.f.e = { 'name' : '+find-config' }
let g:leader_map.f.e.q = { 'name' : '+qtile' }
let g:leader_map.f.e.d = { 'name' : '+dotfiles' }
let g:leader_map.f.e.v = { 'name' : '+vim' }
let g:leader_map.f['c'] = 'CD to current directory' 
let g:leader_map.f['s'] = 'Save file' 
let g:leader_map.f['S'] = 'Save all files' 
let g:leader_map.f['v'] = 'Grep' 

let g:leader_map.h = { 'name' : '+help' }
let g:leader_map.h.r      = { 'name' : '+reload' }
let g:leader_map.h.r['e'] = 'Reload env' 
let g:leader_map.h.r['p'] = 'Reload plugins' 
let g:leader_map.h.r['r'] = 'Reload' 

let g:leader_map.i = { 'name' : '+insert' }
let g:leader_map.i['t'] = 'Insert Toilet title' 

let g:leader_map.p = { 'name' : '+popup' }
let g:leader_map.s = { 'name' : '+search' }

let g:leader_map.t = { 'name' : '+toggle' }
let g:leader_map.t['p'] = 'Paste mode' 
let g:leader_map.t['s'] = 'Spell check' 

let g:leader_map.w = { 'name' : '+window' }
let g:leader_map.w['+'] = 'Increase window height' 
let g:leader_map.w['-'] = 'Decrease window height' 
let g:leader_map.w['<'] = 'Decrease window width' 
let g:leader_map.w['='] = 'Balance windows' 
let g:leader_map.w['>'] = 'Increase window width' 
let g:leader_map.w['_'] = 'Set window height' 
let g:leader_map.w['b'] = 'Bottom-right window' 
let g:leader_map.w['c'] = 'Close window' 
let g:leader_map.w['d'] = 'Close window' 
let g:leader_map.w['h'] = 'Left window' 
let g:leader_map.w['H'] = 'Move window left' 
let g:leader_map.w['j'] = 'Down window' 
let g:leader_map.w['J'] = 'Move window down' 
let g:leader_map.w['k'] = 'Up window' 
let g:leader_map.w['K'] = 'Move window up' 
let g:leader_map.w['l'] = 'Right window' 
let g:leader_map.w['L'] = 'Move window right' 
let g:leader_map.w['n'] = 'New window' 
let g:leader_map.w['o'] = 'Enlargen window' 
let g:leader_map.w['p'] = 'Last window' 
let g:leader_map.w['q'] = 'Quit vim' 
let g:leader_map.w['r'] = 'Rotate windows downwards' 
let g:leader_map.w['R'] = 'Rotate windows upwards' 
let g:leader_map.w['s'] = 'Split window' 
let g:leader_map.w['S'] = 'Split and follow window' 
let g:leader_map.w['t'] = 'Top-left window' 
let g:leader_map.w['T'] = 'Tear off window' 
let g:leader_map.w['v'] = 'VSplit window' 
let g:leader_map.w['V'] = 'VSplit and follow window' 
let g:leader_map.w['w'] = 'Next window' 
let g:leader_map.w['W'] = 'Previous window' 
let g:leader_map.w['|'] = 'Set window width' 


" ░█░░░█▀█░█▀▀░█▀█░█░░
" ░█░░░█░█░█░░░█▀█░█░░
" ░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

" default mappings like ]s stop working if which-key doesn't know about them
call which_key#register('[', "g:left_square_bracket_map")
call which_key#register(']', "g:right_square_bracket_map")
nnoremap <silent> [ :WhichKey '['<CR>
nnoremap <silent> ] :WhichKey ']'<CR>

let g:right_square_bracket_map = {}
let g:right_square_bracket_map.c = [ '<Plug>(GitGutterNextHunk)', 'Next Git Hunk' ]
let g:right_square_bracket_map.g = [ '<Plug>(coc-diagnostic-next)', 'Next Coc Problem' ]
" let g:right_square_bracket_map.s = [ '', 'Next Spell Check Problem' ]

let g:left_square_bracket_map = {}
let g:left_square_bracket_map.c = [ '<Plug>(GitGutterNextHunk)', 'Next Git Hunk' ]
let g:left_square_bracket_map.g = [ '<Plug>(coc-diagnostic-next)', 'Next Coc Problem' ]
" let g:left_square_bracket_map.s = [ '', 'Next Spell Check Problem' ]
