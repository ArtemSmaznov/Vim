let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

let g:floaterm_opener = 'tabe'
let g:floaterm_autoclose = 1

command! Vifm FloatermNew vifm
command! Python FloatermNew python

map <leader>pv :Vifm<cr>
map <leader>pr :Ranger<cr>
map <leader>pp :Python<cr>

