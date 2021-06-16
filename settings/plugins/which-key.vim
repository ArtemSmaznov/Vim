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
nnoremap <silent> <leader> :WhichKey ' '<CR>
vnoremap <silent> <leader> :WhichKeyVisual ' '<CR>

" Define prefix dictionary
let g:leader_map =  {}

let g:leader_map['<'] = 'Switch buffer' 
let g:leader_map['`'] = [ 'term'        , 'Terminal' ]

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
let g:leader_map.f['c'] = [ 'cd %:p:h<cr>:pwd<cr>' , 'CD to current directory' ]
let g:leader_map.f['f'] = [ 'Files'                , 'Find file' ]
let g:leader_map.f['r'] = [ 'History'              , 'Recent files' ]
let g:leader_map.f['s'] = [ ':write'               , 'Save file' ]
let g:leader_map.f['S'] = [ ':wa'                  , 'Save all files' ]
let g:leader_map.f['v'] = [ 'vimgrep'              , 'Grep' ]
let g:leader_map.f.e    = { 'name' : '+find-config' }
let g:leader_map.f.e.q  = { 'name' : '+qtile' }
let g:leader_map.f.e.d  = { 'name' : '+dotfiles' }
let g:leader_map.f.e.v  = { 'name' : '+vim' }

let g:leader_map.g      = { 'name' : '+git' }
let g:leader_map.g['d'] = [ 'vertical Gdiffsplit'          , 'Diff Split' ]
let g:leader_map.g['g'] = [ 'vertical Gstatus'             , 'Status' ]
let g:leader_map.g['p'] = [ '<Plug>(GitGutterPreviewHunk)' , 'Preview hunk' ]
let g:leader_map.g['s'] = [ '<Plug>(GitGutterStageHunk)'   , 'Stage hunk' ]
let g:leader_map.g['u'] = [ '<Plug>(GitGutterUndoHunk)'    , 'Undo hunk' ]

let g:leader_map.h        = { 'name' : '+help' }
let g:leader_map.h['b']   = [ 'Maps'                           , 'Bindings' ]
let g:leader_map.h['h']   = [ 'Helptags'                       , 'Search Help' ]
let g:leader_map.h['k']   = [ 'call <SID>show_documentation()' , 'Search Documentation' ]
let g:leader_map.h['t']   = [ 'Colors'                         , 'Load theme' ]
let g:leader_map.h.r      = { 'name' : '+reload' }
let g:leader_map.h.r['e'] = [ ':source $MYVIMRC'    , 'Reload env' ]
let g:leader_map.h.r['p'] = [ ':PlugInstall --sync' , 'Reload plugins' ]
let g:leader_map.h.r['a'] = [ ':source %'           , 'Reload' ]
let g:leader_map.h.r['r'] = [ ':source %'           , 'Reload' ]

let g:leader_map.m = { 'name' : '+minimap' }

let g:leader_map.p      = { 'name' : '+popup' }
let g:leader_map.p["'"] = [ 'Marks'          , 'Search marks' ]
let g:leader_map.p['/'] = [ 'History/'       , 'Search history' ]
let g:leader_map.p[':'] = [ 'History:'       , 'Commands history' ]
let g:leader_map.p['`'] = [ 'FloatermToggle' , 'Terminal' ]
let g:leader_map.p['b'] = [ 'Buffers'        , 'Switch buffer' ]
let g:leader_map.p['c'] = [ 'Commands'       , 'Search all commands' ]
let g:leader_map.p['f'] = [ 'Filetypes'      , 'Switch filetype' ]
let g:leader_map.p['w'] = [ 'Windows'        , 'Switch window' ]

let g:leader_map.s      = { 'name' : '+search' }
let g:leader_map.s['b'] = [ 'BLines' , 'Search buffer' ]
let g:leader_map.s['B'] = [ 'Lines'  , 'Search all open buffers' ]
let g:leader_map.s['p'] = [ 'RG'     , 'Search project' ]
let g:leader_map.s['t'] = [ 'BTags'  , 'Search Tags in buffer' ]
let g:leader_map.s['T'] = [ 'Tags'   , 'Search Tags in all buffers' ]

let g:leader_map.t      = { 'name' : '+toggle' }
let g:leader_map.t['c'] = [ 'ColorToggle'      , 'Color highlights' ]
let g:leader_map.t['m'] = [ 'MinimapToggle'    , 'Minimap' ]
let g:leader_map.t['p'] = [ ':setlocal paste!' , 'Paste mode' ]
let g:leader_map.t['s'] = [ ':setlocal spell!' , 'Spell check' ]

let g:leader_map.w = { 'name' : '+window' }
let g:leader_map.w['+'] = [ ':resize +5<cr>'           , 'Increase window height' ]
let g:leader_map.w['-'] = [ ':resize -5<cr>'           , 'Decrease window height' ]
let g:leader_map.w['<'] = [ ':vertical :resize -5<cr>' , 'Decrease window width' ]
let g:leader_map.w['='] = [ '<C-W>='                   , 'Balance windows' ]
let g:leader_map.w['>'] = [ ':vertical :resize +5<cr>' , 'Increase window width' ]
let g:leader_map.w['_'] = [ '<C-W>_'                   , 'Set window height' ]
let g:leader_map.w['b'] = [ '<C-W>b'                   , 'Bottom-right window' ]
let g:leader_map.w['c'] = [ '<C-W>c'                   , 'Close window' ]
let g:leader_map.w['d'] = [ '<C-W>c'                   , 'Close window' ]
let g:leader_map.w['h'] = [ '<C-W>h'                   , 'Left window' ]
let g:leader_map.w['H'] = [ '<C-W>H'                   , 'Move window left' ]
let g:leader_map.w['j'] = [ '<C-W>j'                   , 'Down window' ]
let g:leader_map.w['J'] = [ '<C-W>J'                   , 'Move window down' ]
let g:leader_map.w['k'] = [ '<C-W>k'                   , 'Up window' ]
let g:leader_map.w['K'] = [ '<C-W>K'                   , 'Move window up' ]
let g:leader_map.w['l'] = [ '<C-W>l'                   , 'Right window' ]
let g:leader_map.w['L'] = [ '<C-W>L'                   , 'Move window right' ]
let g:leader_map.w['n'] = [ '<C-W>n'                   , 'New window' ]
let g:leader_map.w['o'] = [ '<C-W>o'                   , 'Enlargen window' ]
let g:leader_map.w['p'] = [ '<C-W>p'                   , 'Last window' ]
let g:leader_map.w['q'] = [ '<C-W>q'                   , 'Quit vim' ]
let g:leader_map.w['r'] = [ '<C-W>r'                   , 'Rotate windows downwards' ]
let g:leader_map.w['R'] = [ '<C-W>R'                   , 'Rotate windows upwards' ]
let g:leader_map.w['s'] = [ '<C-W>s'                   , 'Split window' ]
let g:leader_map.w['S'] = [ '<C-W>S'                   , 'Split and follow window' ]
let g:leader_map.w['t'] = [ '<C-W>t'                   , 'Top-left window' ]
let g:leader_map.w['T'] = [ '<C-W>T'                   , 'Tear off window' ]
let g:leader_map.w['v'] = [ '<C-W>v'                   , 'VSplit window' ]
let g:leader_map.w['V'] = [ '<C-W>V'                   , 'VSplit and follow window' ]
let g:leader_map.w['w'] = [ '<C-W>w'                   , 'Next window' ]
let g:leader_map.w['W'] = [ '<C-W>W'                   , 'Previous window' ]
let g:leader_map.w['|'] = [ '<C-W>|'                   , 'Set window width' ]



" default mappings like ]s stop working if which-key doesn't know about them
call which_key#register('[', "g:left_square_bracket_map")
call which_key#register(']', "g:right_square_bracket_map")
nnoremap <silent> [ :WhichKey '['<CR>
nnoremap <silent> ] :WhichKey ']'<CR>


let g:leader_map[','] = {
      \ 'name' : '+Leaderless',
      \ 'cd' : ['cd %:p:h<cr>:pwd', 'CD to PWD of open Buffer']
      \}

let g:right_square_bracket_map = {}
let g:right_square_bracket_map.c = [ '<Plug>(GitGutterNextHunk)', 'Next Git Hunk' ]
let g:right_square_bracket_map.g = [ '<Plug>(coc-diagnostic-next)', 'Next Coc Problem' ]
" let g:right_square_bracket_map.s = [ '', 'Next Spell Check Problem' ]

let g:left_square_bracket_map = {}
let g:left_square_bracket_map.c = [ '<Plug>(GitGutterNextHunk)', 'Next Git Hunk' ]
let g:left_square_bracket_map.g = [ '<Plug>(coc-diagnostic-next)', 'Next Coc Problem' ]
" let g:left_square_bracket_map.s = [ '', 'Next Spell Check Problem' ]
