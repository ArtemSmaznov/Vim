if has_key(plugs, 'vim-which-key') | let g:which_key_map['<']     = 'Switch buffer'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map['<Esc>'] = 'Clear search highlights' | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map['`']     = 'Switch to last buffer'   | endif

map <leader>< :BufExplorerHorizontalSplit<cr>
nnoremap <silent> <leader><Esc> :nohlsearch<cr>
map <leader>` :b#<cr>

" if has_key(plugs, 'vim-which-key') | let g:which_key_map['<TAB>']      = { 'name' : '+workspace' }  | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map['<C-I>']      = { 'name' : '+workspace' }  | endif
map <leader><Tab>. :tabs<cr>
map <leader><Tab>0 :$tabnext<cr>
map <leader><Tab>1 :1tabnext<cr>
map <leader><Tab>2 :2tabnext<cr>
map <leader><Tab>3 :3tabnext<cr>
map <leader><Tab>4 :4tabnext<cr>
map <leader><Tab>5 :5tabnext<cr>
map <leader><Tab>6 :6tabnext<cr>
map <leader><Tab>7 :7tabnext<cr>
map <leader><Tab>8 :8tabnext<cr>
map <leader><Tab>9 :9tabnext<cr>
map <leader><Tab>< :0tabmove<cr>
map <leader><Tab>> :$tabmove<cr>
map <leader><Tab>[ :tabprevious<cr>
map <leader><Tab>] :tabnext<cr>
map <leader><Tab>` :tabnext #<cr>
map <leader><Tab>c :tabclose<cr>
map <leader><Tab>d :tabclose<cr>
map <leader><Tab>m :tabmove
map <leader><Tab>n :tabnew<cr>
map <leader><Tab>O :tabonly<cr>
map <leader><Tab>{ :-tabmove<cr>
map <leader><Tab>} :+tabmove<cr>


" Toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader><Tab>l :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

if has_key(plugs, 'vim-which-key') | let g:which_key_map.b      = { 'name' : '+buffer' }  | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['['] = 'Previous buffer'       | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b[']'] = 'Next buffer'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['b'] = 'Switch buffer'         | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['d'] = 'Kill buffer'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['k'] = 'Kill buffer'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['K'] = 'Kill all buffers'      | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['n'] = 'Next buffer'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['N'] = 'New empty tab'         | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['O'] = 'Kill other buffers'    | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['p'] = 'Previous buffer'       | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['l'] = 'Switch to last buffer' | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['s'] = 'Save buffer'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['S'] = 'Save all buffers'      | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.b['u'] = 'Save buffer as root'   | endif

map <leader>b[ :bprevious<cr>
map <leader>b] :bnext<cr>
map <leader>bb :BufExplorerHorizontalSplit<cr>
map <leader>bd :Bclose<cr>
map <leader>bk :Bclose<cr>
map <leader>bK :bufdo bd<cr>
map <leader>bn :bnext<cr>
map <leader>bN :tabe<cr>
" map <leader>bO :<bar> %bd <bar> e#<cr>
map <leader>bp :bprevious<cr>
map <leader>bl :b#<cr>
map <leader>bs :write<cr>
map <leader>bS :wa<cr>
map <leader>bu :W<cr>

if has_key(plugs, 'vim-which-key') | let g:which_key_map.c = { 'name' : '+code' } | endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.f      = { 'name' : '+file' }          | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['c'] = 'CD to current directory'     | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['C'] = 'Copy this file'              | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['d'] = 'Find directory'              | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['D'] = 'Delete this file'            | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['e'] = 'Find file in vim.d'          | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['E'] = 'Browse vim.d'                | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['F'] = 'Find file from here'         | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['l'] = 'Locate file'                 | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['p'] = 'Find file in private config' | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['P'] = 'Browse private config'       | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['R'] = 'Rename/move file'            | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['s'] = 'Save file'                   | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['S'] = 'Save as...'                  | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['u'] = 'Sudo find file'              | endif
" if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['U'] = 'Sudo this file'              | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['y'] = 'Yank file path'              | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['Y'] = 'Yank file path from project' | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['v'] = 'Grep?'                       | endif

map <leader>fc :cd %:p:h<cr>:pwd<cr>
map <silent> <leader>fD :if confirm('Really delete "' . expand('%') . '"?', "&Yes\n&No", 1)==1 <Bar> exe ":call delete(@%)" <Bar> exe ":Bclose" <Bar> endif<cr>

map <leader>fy :let @" = expand('%:p')<cr>:let @+ = expand('%:p')<cr>:echo "Copied path to clipboard: " . expand('%:p')<cr>
map <leader>fY :let @" = expand('%')<cr>:let @+ = expand('%')<cr>:echo "Copied path to clipboard: " . expand('%')<cr>
map <leader>fs :write<cr>
map <leader>fS :write 
map <leader>fv :vimgrep **/*

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['f'] = 'Find file'    | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.f['r'] = 'Recent files' | endif

    map <leader>ff :Files<CR>
    map <leader>fr :History<CR>
endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.g      = { 'name' : '+git' } | endif

if has_key(plugs, 'vim-gitgutter')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.g['d'] = 'Diff Split'        | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.g['g'] = 'Status'            | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.g['p'] = 'Preview hunk'      | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.g['s'] = 'Stage hunk'        | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.g['u'] = 'Undo hunk'         | endif
    if has_key(plugs, 'vim-which-key') | let g:squre_bracket_map.c        = 'Git Hunk'          | endif

    nnoremap <silent> <leader>gd :vertical Gdiffsplit<cr>
    nnoremap <silent> <leader>gg :Git<cr>

    nmap <leader>gp <Plug>(GitGutterPreviewHunk)
    map <leader>gs <Plug>(GitGutterStageHunk)
    nmap <leader>gu <Plug>(GitGutterUndoHunk)
endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.h = { 'name' : '+help' } | endif

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.h['k'] = 'describe-key'         | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.h['s'] = 'help-search-headings' | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.h['t'] = 'load-theme'           | endif

    map <leader>hk :Maps<CR>
    nnoremap <leader>hs :Helptags<CR>
    nnoremap <leader>ht :Colors<CR>
endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.h.r      = { 'name' : '+reload' } | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.h.r['e'] = 'reload-env'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.h.r['p'] = 'reload-packages'      | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.h.r['r'] = 'reload'               | endif

map <leader>hre :source $MYVIMRC<cr>
map <leader>hrr :source %<cr>

if has_key(plugs, 'vim-which-key') | let g:which_key_map.i      = { 'name' : '+insert' } | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.i['t'] = 'Toilet pagga'         | endif

map <leader>it :r !toilet -f pagga

if has_key(plugs, 'vim-which-key') | let g:which_key_map.o = { 'name' : '+open' } | endif

if has_key(plugs, 'vim-floaterm')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.o['t'] = 'Toggle term popup' | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.o['p'] = 'Python'   | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.o['r'] = 'Ranger'   | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.o['v'] = 'Vifm'     | endif

    map <leader>ot :FloatermToggle<cr>
    map <leader>op :FloatermNew python<cr>
    map <leader>or :FloatermNew ranger<cr>
    map <leader>ov :FloatermNew vifm<cr>
endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.m = { 'name' : '+<localleader>' } | endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.p = { 'name' : '+popup' } | endif

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.p["'"] = 'Search marks'        | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.p['/'] = 'Search history'      | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.p[':'] = 'Commands history'    | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.p['b'] = 'Switch buffer'       | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.p['c'] = 'Search all commands' | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.p['f'] = 'Switch filetype'     | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.p['w'] = 'Switch window'       | endif

    nnoremap <leader>p' :Marks<CR>
    nnoremap <leader>p/ :History/<CR>
    nnoremap <leader>p: :History:<CR>
    map <leader>pb :Buffers<CR>
    map <leader>pc :Commands<CR>
    map <leader>pf :Filetypes<CR>
    map <leader>pw :Windows<CR>
endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.q      = { 'name' : '+quit/session' } | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.q['l'] = 'Restore last session'       | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.q['L'] = 'Restore session from file'  | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.q['q'] = 'Quit Vim'                   | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.q['Q'] = 'Quit Vim without saving'    | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.q['s'] = 'Quick save current session' | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.q['S'] = 'Save session to file'       | endif

map <leader>ql :source $HOME/.vim/sessions/quick-session.vim<cr>
map <leader>qL :source $HOME/.vim/sessions/
map <leader>qq :qa<cr>
map <leader>qQ :qa!<cr>
map <leader>qs :mksession! $HOME/.vim/sessions/quick-session.vim<cr>
map <leader>qS :mksession $HOME/.vim/sessions/

if has_key(plugs, 'vim-which-key') | let g:which_key_map.s = { 'name' : '+search' } | endif

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.s['b'] = 'Search buffer'              | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.s['B'] = 'Search all open buffers'    | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.s['p'] = 'Search project'             | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.s['t'] = 'Search Tags in buffer'      | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.s['T'] = 'Search Tags in all buffers' | endif

    map <leader>sb :BLines<CR>
    map <leader>sB :Lines<CR>
    nnoremap <leader>sp :Rg<CR>
    nnoremap <leader>st :BTags<CR>
    nnoremap <leader>sT :Tags<CR>
endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.t      = { 'name' : '+toggle' } | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['p'] = 'Paste mode'           | endif 
if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['s'] = 'Spell checker'        | endif 

map <leader>tp :setlocal paste!<cr>
map <leader>ts :setlocal spell!<cr>

if has_key(plugs, 'vim-minimap')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['m']      = 'Minimap'                  | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['M']      = { 'name' : '+minimap...' } | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['M']['c'] = 'Close minimap'            | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['M']['o'] = 'Open minimap'             | endif
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['M']['u'] = 'Update minimap'           | endif
    
    let g:minimap_show='<leader>tMo'
    let g:minimap_update='<leader>tMu'
    let g:minimap_close='<leader>tMc'
    let g:minimap_toggle='<leader>tm'
endif

if has_key(plugs, 'Colorizer')
    if has_key(plugs, 'vim-which-key') | let g:which_key_map.t['c'] = 'Colors' | endif
    
    nnoremap <leader>tc :ColorToggle<cr>
endif

if has_key(plugs, 'vim-which-key') | let g:which_key_map.w      = { 'name' : '+window' }       | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['+'] = 'Increase window height'     | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['-'] = 'Decrease window height'     | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['<'] = 'Decrease window width'      | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['='] = 'Balance windows'            | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['>'] = 'Increase window width'      | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['_'] = 'Set window height'          | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['`'] = 'Open a terminal in a split' | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['b'] = 'Bottom-right window'        | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['c'] = 'Close window'               | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['d'] = 'Close window'               | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['h'] = 'Left window'                | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['H'] = 'Move window left'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['j'] = 'Down window'                | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['J'] = 'Move window down'           | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['k'] = 'Up window'                  | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['K'] = 'Move window up'             | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['l'] = 'Right window'               | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['L'] = 'Move window right'          | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['n'] = 'New window'                 | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['o'] = 'Enlargen window'            | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['p'] = 'Last window'                | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['q'] = 'Quit window'                | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['r'] = 'Rotate windows downwards'   | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['R'] = 'Rotate windows upwards'     | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['s'] = 'Split window'               | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['S'] = 'Split and follow window'    | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['t'] = 'Top-left window'            | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['T'] = 'Tear off window'            | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['v'] = 'VSplit window'              | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['V'] = 'VSplit and follow window'   | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['w'] = 'Next window'                | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['W'] = 'Previous window'            | endif
if has_key(plugs, 'vim-which-key') | let g:which_key_map.w['|'] = 'Set window width'           | endif

map <leader>w+ :resize +5<cr>
map <leader>w- :resize -5<cr>
map <leader>w< :vertical resize -5<cr>
map <leader>w= <C-w>=
map <leader>w> :vertical resize +5<cr>
map <leader>w_ :resize<cr>
map <leader>w` :term<cr>
map <leader>wb <C-w>b
map <leader>wc :close<cr>
map <leader>wd :close<cr>
map <leader>wh <C-w>h
map <leader>wH <C-w>H
map <leader>wj <C-w>j
map <leader>wJ <C-w>J
map <leader>wk <C-w>k
map <leader>wK <C-w>K
map <leader>wl <C-w>l
map <leader>wL <C-w>L
map <leader>wn :new<cr>
map <leader>wo :only<cr>
map <leader>wp <C-w>p
map <leader>wq :quit<cr>
map <leader>wr <C-w>r
map <leader>wR <C-w>R
map <leader>ws :split<cr><C-w>p
map <leader>wS :split<cr>
map <leader>wt <C-w>t
map <leader>wT <C-w>T
map <leader>wv :vsplit<cr><C-w>p
map <leader>wV :vsplit<cr>
map <leader>ww <C-w>w
map <leader>wW <C-w>W
map <leader>w\| :vertical resize<cr>

" if has_key(plugs, 'vim-which-key') | let g:g_map['m'] = 'middle-of-visual-line' | endif
" if has_key(plugs, 'vim-which-key') | let g:g_map['M'] = 'percentage-of-line'    | endif
if has_key(plugs, 'vim-which-key') | let g:g_map['-'] = 'number/dec-at-point'    | endif
if has_key(plugs, 'vim-which-key') | let g:g_map['='] = 'number/inc-at-point'    | endif

noremap g- <C-x>
noremap g= <C-a>

if has_key(plugs, 'vim-exchange')
    if has_key(plugs, 'vim-which-key') | let g:g_map["x"] = 'vim-exchange'        | endif

    nmap gx <Plug>(Exchange)
    nmap gxx <Plug>(ExchangeLine)
    nmap gxc <Plug>(ExchangeClear)
    xmap gx <Plug>(Exchange)
endif





nnoremap <Up> :blast<cr>
nnoremap <Down> :bfirst<cr>
nnoremap <Left> :bprevious<cr>
nnoremap <Right> :bnext<cr>

if has_key(plugs, 'vim-which-key') | let g:squre_bracket_map['['] = 'Move around functions' | endif
if has_key(plugs, 'vim-which-key') | let g:squre_bracket_map[']'] = 'Move around functions' | endif
if has_key(plugs, 'vim-which-key') | let g:squre_bracket_map['"'] = 'Move around comments'  | endif

noremap <tab> :norm za<cr>
noremap <tab><tab> :norm zA<cr>
noremap <S-tab> :norm zR<cr>
noremap <S-tab><S-tab> :norm zM<cr>

map <A-x> :

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

nnoremap <A-k> :m-2<cr>==
nnoremap <A-j> :m+<cr>==
vnoremap <A-k> :m '<-2<cr>gv=gv
vnoremap <A-j> :m '>+1<cr>gv=gv
