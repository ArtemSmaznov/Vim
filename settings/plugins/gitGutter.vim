let g:gitgutter_enabled=1

nnoremap <silent> <leader>gd :vertical Gdiffsplit<cr>
nnoremap <silent> <leader>gg :vertical Gstatus<cr>

nmap <leader>gp <Plug>(GitGutterPreviewHunk)
map <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

let g:which_key_map.g      = { 'name' : '+git' }
let g:which_key_map.g['d'] = 'Diff Split' 
let g:which_key_map.g['g'] = 'Status' 
let g:which_key_map.g['p'] = 'Preview hunk' 
let g:which_key_map.g['s'] = 'Stage hunk' 
let g:which_key_map.g['u'] = 'Undo hunk' 

let g:bracket_map.c = 'Git Hunk'
