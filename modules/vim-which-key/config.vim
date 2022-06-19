let g:which_key_max_size = 0
let g:which_key_flatten = 1
let g:which_key_vertical = 0
let g:which_key_position = 'botright'
let g:which_key_use_floating_win = 0
let g:which_key_fallback_to_native_key=1
let g:which_key_display_names = { 
  \ ' '     : 'SPC',
  \ '<ESC>' : 'ESC',
  \ '<CR>'  : 'RET',
  \ '<TAB>' : 'TAB',
  \ '<C-I>' : 'TAB',
  \ '<C-H>' : 'BS',
  \ '<UP>' : 'up',
  \ '<DOWN>' : 'down',
  \ '<LEFT>' : 'left',
  \ '<RIGHT>' : 'right',
  \ '<HOME>' : 'home',
  \ '<END>' : 'end',
  \ '<F1>'  : 'f1',
  \ '<F2>'  : 'f2',
  \ '<F3>'  : 'f3',
  \ '<F4>'  : 'f4',
  \ '<F5>'  : 'f5',
  \ '<F6>'  : 'f6',
  \ '<F7>'  : 'f7',
  \ '<F8>'  : 'f8',
  \ '<F9>'  : 'f9',
  \ '<F10>' : 'f10',
  \ '<F11>' : 'f11',
  \ '<F12>' : 'f12',
  \ '<HELP>': 'help'
  \}
let g:which_key_centered = 0
let g:which_key_default_group_name = '+prefix'
let g:which_key_exit = "\<C-G>"


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

" []
call which_key#register('[', "g:l_sqr_bracket_map")
call which_key#register(']', "g:r_sqr_bracket_map")
nnoremap <silent> [ :<c-u>WhichKey '['<CR>
nnoremap <silent> ] :<c-u>WhichKey ']'<CR>
let g:l_sqr_bracket_map = {}
let g:r_sqr_bracket_map = {}

" g
call which_key#register('g', "g:g_map")
nnoremap <silent> g :<c-u>WhichKey 'g'<CR>
vnoremap <silent> g :<c-u>WhichKeyVisual 'g'<CR>
let g:g_map = {}

" z
call which_key#register('z', "g:z_map")
nnoremap <silent> z :<c-u>WhichKey 'z'<CR>
vnoremap <silent> z :<c-u>WhichKeyVisual 'z'<CR>
let g:z_map = {}

" Z
call which_key#register('Z', "g:Z_map")
nnoremap <silent> Z :<c-u>WhichKey 'Z'<CR>
vnoremap <silent> Z :<c-u>WhichKeyVirual 'Z'<CR>
let g:Z_map = {}
