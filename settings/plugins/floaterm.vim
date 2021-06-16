let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

let g:floaterm_opener = 'tabe'
let g:floaterm_autoclose = 1

map <leader>p` :FloatermToggle<cr>
map <leader>pp :FloatermNew python<cr>
map <leader>pr :FloatermNew ranger<cr>
map <leader>pv :FloatermNew vifm<cr>

let g:which_key_map.p['`'] = 'Terminal' 
let g:which_key_map.p['p'] = 'Python' 
let g:which_key_map.p['r'] = 'Ranger' 
let g:which_key_map.p['v'] = 'Vifm' 
