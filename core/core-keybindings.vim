function! ClearAll()
    call feedkeys( ":nohlsearch\<CR>" )
    call feedkeys( "\<Plug>(ExchangeClear)" )
endfunction

function! Cycle_LineNumbers()
    if &number && &relativenumber
        setlocal norelativenumber
        echo 'Switched to normal line numbers'
    elseif &number && ! &relativenumber
        setlocal nonumber
        echo 'Switched to disabled line numbers'
    else
        setlocal number
        setlocal relativenumber
        echo 'Switched to relative line numbers'
    endif
endfunction

function! Toggle_Mode( mode, enable_message, disable_message )
    execute 'setlocal ' . a:mode . '!'
    execute 'echo (&' . a:mode' ? "' . a:enable_message . '" : "' . a:disable_message . '")'
endfunction

function! Toggle_FillColumn()
    execute 'set colorcolumn=' . (&colorcolumn == '' ? '-0' : '')
    execute 'echo ' . (&colorcolumn == '' ? '"Global Dispaly-Fill-Column-Indicator mode disabled"' : '"Global Dispaly-Fill-Column-Indicator mode enabled"')
endfunction

if has_key(plugs, 'Colorizer')
    function! Toggle_Rainbow()
        if !exists('w:match_list') || empty(w:match_list)
            echo 'Rainbow mode enabled in current buffer'
            ColorHighlight
        else
            echo 'Rainbow mode disabled in current buffer'
            ColorClear
        endif
    endfunction
endif

function! Reveal_In_Files()
    if has('linux')
        let opencmd = '!xdg-open '
    elseif has('mac') || has('macunix')
        let opencmd = '!open '
    elseif has('win16') || has('win32')
        let opencmd = '!explorer.exe '
        " let opencmd = '!start explorer.exe /select,'
    endif

    silent execute opencmd . expand('%:p:h')
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'vertical h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

if has_key(plugs, 'vim-which-key')
    " let g:which_key_map['<Esc>'] = 'Reset/Cleanup'
    let g:which_key_map[',']     = 'Switch workspace buffer'
    let g:which_key_map['<']     = 'Switch buffer'
    let g:which_key_map['`']     = 'Switch to last buffer'
endif

" Can cause issues
nnoremap <silent> <Esc> :call ClearAll()<cr>

" nnoremap <silent> <leader><Esc> :call ClearAll()<cr>
nnoremap <leader>, :BufExplorerHorizontalSplit<cr>
nnoremap <leader>< :Buffers<cr>
nnoremap <leader>` :b#<cr>

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map[' '] = ['GFiles', 'Find file in project' ]
    endif

    nnoremap <leader><Space> :GFiles<cr>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map['<Tab>']      = { 'name' : '+workspace' }
    let g:which_key_map['<Tab>']['.'] = 'Switch workspace'
    let g:which_key_map['<Tab>']['0'] = 'Switch to final workspace'
    let g:which_key_map['<Tab>']['1'] = 'Switch to 1st workspace'
    let g:which_key_map['<Tab>']['2'] = 'Switch to 2st workspace'
    let g:which_key_map['<Tab>']['3'] = 'Switch to 3st workspace'
    let g:which_key_map['<Tab>']['4'] = 'Switch to 4st workspace'
    let g:which_key_map['<Tab>']['5'] = 'Switch to 5st workspace'
    let g:which_key_map['<Tab>']['6'] = 'Switch to 6st workspace'
    let g:which_key_map['<Tab>']['7'] = 'Switch to 7st workspace'
    let g:which_key_map['<Tab>']['8'] = 'Switch to 8st workspace'
    let g:which_key_map['<Tab>']['9'] = 'Switch to 9st workspace'
    let g:which_key_map['<Tab>']['<'] = 'Move workspace left'
    let g:which_key_map['<Tab>']['>'] = 'Move workspace right'
    let g:which_key_map['<Tab>']['['] = 'Previous workspace'
    let g:which_key_map['<Tab>'][']'] = 'Next workspace'
    let g:which_key_map['<Tab>']['`'] = 'Switch to last workspace'
    let g:which_key_map['<Tab>']['d'] = 'Delete this workspace'
    " let g:which_key_map['<Tab>']['l'] = 'Load workspace from file'
    let g:which_key_map['<Tab>']['n'] = 'New workspace'
    " let g:which_key_map['<Tab>']['R'] = 'Restore last session'
    " let g:which_key_map['<Tab>']['s'] = 'Save workspace to file'
    let g:which_key_map['<Tab>']['O'] = 'Kill other workspaces'
    " let g:which_key_map['<Tab>']['x'] = 'Delete session'
endif

nnoremap <silent> <leader><Tab>. :tabs<cr>
nnoremap <silent> <leader><Tab>0 :$tabnext<cr>
nnoremap <silent> <leader><Tab>1 :1tabnext<cr>
nnoremap <silent> <leader><Tab>2 :2tabnext<cr>
nnoremap <silent> <leader><Tab>3 :3tabnext<cr>
nnoremap <silent> <leader><Tab>4 :4tabnext<cr>
nnoremap <silent> <leader><Tab>5 :5tabnext<cr>
nnoremap <silent> <leader><Tab>6 :6tabnext<cr>
nnoremap <silent> <leader><Tab>7 :7tabnext<cr>
nnoremap <silent> <leader><Tab>8 :8tabnext<cr>
nnoremap <silent> <leader><Tab>9 :9tabnext<cr>
nnoremap <silent> <leader><Tab>< :-tabmove<cr>
nnoremap <silent> <leader><Tab>> :+tabmove<cr>
nnoremap <silent> <leader><Tab>[ :tabprevious<cr>
nnoremap <silent> <leader><Tab>] :tabnext<cr>
nnoremap <silent> <leader><Tab>d :tabclose<cr>
nnoremap <leader><Tab>n :tabnew<cr>
nnoremap <silent> <leader><Tab>O :tabonly<cr>

" Toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <silent> <leader><Tab>` :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

if has_key(plugs, 'fzf')
    nnoremap <silent> <leader><Tab>. :Windows<cr>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.b      = { 'name' : '+buffer' }
    let g:which_key_map.b['['] = 'Previous buffer'
    let g:which_key_map.b[']'] = 'Next buffer'
    let g:which_key_map.b['b'] = 'Switch workspace buffer'
    let g:which_key_map.b['B'] = 'Switch buffer'
    let g:which_key_map.b['d'] = 'Kill buffer'
    let g:which_key_map.b['i'] = 'ibuffer'
    let g:which_key_map.b['k'] = 'Kill buffer'
    let g:which_key_map.b['K'] = 'Kill all buffers'
    let g:which_key_map.b['l'] = 'Switch to last buffer'
    let g:which_key_map.b['L'] = 'List bookmarks'
    let g:which_key_map.b['n'] = 'Next buffer'
    let g:which_key_map.b['N'] = 'New empty buffer'
    let g:which_key_map.b['O'] = 'Kill other buffers'
    let g:which_key_map.b['p'] = 'Previous buffer'
    let g:which_key_map.b['r'] = 'Revert buffer'
    let g:which_key_map.b['s'] = 'Save buffer'
    let g:which_key_map.b['S'] = 'Save all buffers'
    let g:which_key_map.b['u'] = 'Save buffer as root'
endif

nnoremap <silent> <leader>b[ :bprevious<cr>
nnoremap <silent> <leader>b] :bnext<cr>
nnoremap <silent> <leader>bb :BufExplorerHorizontalSplit<cr>
nnoremap <silent> <leader>bB :Buffers<cr>
nnoremap <silent> <leader>bd :Bclose<cr>
nnoremap <silent> <leader>bi :BufExplorer<cr>
nnoremap <silent> <leader>bk :Bclose<cr>
nnoremap <silent> <leader>bK :bufdo bd<cr>
nnoremap <silent> <leader>bl :b#<cr>
nnoremap <silent> <leader>bL :marks<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bN :e *new*<cr>
nnoremap <leader>bO :%bd <Bar> e#<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <silent> <leader>br :if confirm('Discard edits and reread from ' . expand('%:p') . '?', "&Yes\n&No", 1)==1 <Bar> exe ":edit!" <Bar> endif<cr>
nnoremap <leader>bs :write<cr>
nnoremap <leader>bS :wa<cr>
nnoremap <leader>bu :W<cr>

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.c = { 'name' : '+code' }
endif

if has_key(plugs, 'coc.nvim')
    command! -nargs=0 Format :call CocAction('format')
    command! -nargs=0 OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
    
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.c      = { 'name' : '+code' }
        let g:which_key_map.c['a'] = 'LSP Execute code action'
        let g:which_key_map.c['d'] = 'Jump to definition'
        let g:which_key_map.c['D'] = 'Jump to references'
        let g:which_key_map.c['f'] = 'Format buffer/region'
        let g:which_key_map.c['i'] = 'Find implementations'
        let g:which_key_map.c['j'] = 'Jump to symbol in current workspace'
        let g:which_key_map.c['j'] = 'Jump to symbol in any workspace'
        let g:which_key_map.c['k'] = 'Jump to documentation'
        let g:which_key_map.c['o'] = 'LSP Organize imports'
        let g:which_key_map.c['r'] = 'LSP Rename'
        let g:which_key_map.c['x'] = 'List errors'
        let g:which_key_map.c['t'] = 'Find type definition'
    endif

    " do codeAction of current line
    nmap <leader>ca <Plug>(coc-codeaction)
    nnoremap <silent> <leader>cd <Plug>(coc-definition)
    nnoremap <silent> <leader>cD <Plug>(coc-references)
    nnoremap <silent> <leader>cf :Format<cr>
    xnoremap <silent> <leader>cf <Plug>(coc-format-selected)
    nnoremap <silent> <leader>ci <Plug>(coc-implementation)
    " Find symbol of current document
    nnoremap <silent> <leader>cj :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <leader>cJ :<C-u>CocList -I symbols<cr>
    nnoremap <silent> <leader>ck :call <SID>show_documentation()<cr>
    nnoremap <silent> <leader>co :OrganizeImports<cr>
    nnoremap <silent> <leader>cr <Plug>(coc-rename)
    nnoremap <silent> <leader>cx :<C-u>CocList diagnostics<cr>
    nnoremap <silent> <leader>ct <Plug>(coc-type-definition)




    " do codeAction of selected region, ex: `<leader>aap` for current paragraph
    " xmap <leader>cv <Plug>(coc-codeaction-selected)
    " nmap <leader>cv <Plug>(coc-codeaction-selected)
    " let g:which_key_map.c['v'] = 'Code action selected'

    " Fix autofix problem of current line
    " nmap <leader>ca  <Plug>(coc-fix-current)
    " let g:which_key_map.c['a'] = 'Fix current'


    " Manage extensions
    " nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
    " let g:which_key_map.c['e'] = 'Extensions'

    " Show commands
    " nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
    " let g:which_key_map.c['c'] = 'Commands'

    " nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
    " let g:which_key_map.c['j'] = 'Default action for next item'

    " nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
    " let g:which_key_map.c['k'] = 'Default action for previous item'

endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.f      = { 'name' : '+file' }          
    let g:which_key_map.f['c'] = 'CD to current directory'
    " let g:which_key_map.f['c'] = 'Open project editorconfig'
    " let g:which_key_map.f['C'] = 'Copy this file'
    " let g:which_key_map.f['d'] = 'Find directory'
    let g:which_key_map.f['D'] = 'Delete this file'
    let g:which_key_map.f['E'] = 'Browse vim.d'
    let g:which_key_map.f['P'] = 'Browse private config'
    " let g:which_key_map.f['R'] = 'Rename/move file'
    let g:which_key_map.f['s'] = 'Save file'
    let g:which_key_map.f['S'] = 'Save as...'
    " let g:which_key_map.f['u'] = 'Sudo find file'
    " let g:which_key_map.f['U'] = 'Sudo this file'
    let g:which_key_map.f['y'] = 'Yank file path'
    let g:which_key_map.f['Y'] = 'Yank file path from project'
    let g:which_key_map.f['v'] = 'Grep?'
endif

nnoremap <leader>fc :cd %:p:h<cr>:pwd<cr>
nnoremap <silent> <leader>fD :if confirm('Really delete "' . expand('%') . '"?', "&Yes\n&No", 1)==1 <Bar> exe ":call delete(@%)" <Bar> exe ":Bclose" <Bar> endif<cr>
nnoremap <leader>fE :Hexplore ~/.vim/core<cr>
nnoremap <leader>fP :Hexplore ~/.vim<cr>
nnoremap <leader>fs :write<cr>
nnoremap <leader>fS :write
nnoremap <leader>fy :let @" = expand('%:p')<cr>:let @+ = expand('%:p')<cr>:echo "Copied path to clipboard: " . expand('%:p')<cr>
nnoremap <leader>fY :let @" = expand('%')<cr>:let @+ = expand('%')<cr>:echo "Copied path to clipboard: " . expand('%')<cr>
nnoremap <leader>fv :vimgrep **/*

if has_key(plugs, 'fzf' )
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.f['e'] = 'Find file in vim.d'          
        " let g:which_key_map.f['f'] = 'Find file'
        let g:which_key_map.f['F'] = 'Find file from here'
        let g:which_key_map.f['l'] = 'Locate file'
        let g:which_key_map.f['p'] = 'Find file in private config'
        let g:which_key_map.f['r'] = 'Recent files'
    endif

    map <leader>fe :Files ~/.vim/core<CR>
    map <leader>fF :Files<CR>
    map <leader>fl :Locate
    map <leader>fp :Files ~/.vim<CR>
    map <leader>fr :History<CR>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.g = { 'name' : '+git' }
endif

if has_key(plugs, 'vim-gitgutter')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.g['['] = 'Jump to previous hunk'
        let g:which_key_map.g[']'] = 'Jump to next hunk'
        let g:which_key_map.g['p'] = 'Preview hunk'
        let g:which_key_map.g['s'] = 'Git stage hunk'
        let g:which_key_map.g['r'] = 'Revert hunk'
    endif

    nmap <leader>g[ <Plug>(GitGutterPrevHunk)
    nmap <leader>g] <Plug>(GitGutterNextHunk)
    nmap <leader>gp <Plug>(GitGutterPreviewHunk)
    nmap <leader>gs <Plug>(GitGutterStageHunk)
    nmap <leader>gr <Plug>(GitGutterUndoHunk)
endif

if has_key(plugs, 'vim-fugitive')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.g['d'] = 'Diff Split'
        let g:which_key_map.g['g'] = 'Status'
    endif
    
    nmap <silent> <leader>gd :Gvdiffsplit<cr>
    nmap <silent> <leader>gg :Git<cr>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.h           = { 'name' : '+help' }
    let g:which_key_map.h['<CR>']   = 'Info vim Manual'
    let g:which_key_map.h['?']      = 'Help for help'
    let g:which_key_map.h['e']      = 'View echo area messages'
    let g:which_key_map.h['i']      = 'Show version info'
    let g:which_key_map.h['q']      = 'Help quit'
    let g:which_key_map.h['v']      = 'Show version info'
    let g:which_key_map.h['<F1>']   = 'Help for help'
    let g:which_key_map.h['<Help>'] = 'Help for help'
endif

nnoremap <silent> <leader>h<CR> :help<cr>
nnoremap <silent> <leader>h? :help helphelp<cr>
nnoremap <silent> <leader>he :messages<cr>
nnoremap <silent> <leader>hi :version<cr>
nnoremap <silent> <leader>hq :helpclose<cr>
nnoremap <silent> <leader>hv :version<cr>
nnoremap <silent> <leader>h<F1> :help helphelp<cr>
nnoremap <silent> <leader>h<Help> :help helphelp<cr>

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.h['k'] = 'Describe key'
        let g:which_key_map.h['s'] = 'Help search headings'
        let g:which_key_map.h['t'] = 'Load theme'
    endif

    nnoremap <silent> <leader>hk :Maps<cr>
    nnoremap <silent> <leader>hs :Helptags<cr>
    nnoremap <silent> <leader>ht :Colors<cr>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.h.r      = { 'name' : '+reload' }
    let g:which_key_map.h.r['f'] = 'Reload this file'
    let g:which_key_map.h.r['p'] = 'Reload packages'
    let g:which_key_map.h.r['r'] = 'Reload'
    let g:which_key_map.h.r['t'] = 'Reload theme'
endif

nnoremap <silent> <leader>hrf :source % <Bar> echo "Current file successfully reloaded!"<cr>
nnoremap <silent> <leader>hrp :PlugInstall --sync<cr>
nnoremap <silent> <leader>hrr :source $MYVIMRC<cr>
nnoremap <silent> <leader>hrt :execute 'colorscheme ' . g:colors_name<cr>

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.i      = { 'name' : '+insert' }
    let g:which_key_map.i['f'] = 'Current file name'
    let g:which_key_map.i['F'] = 'Current file path'
    let g:which_key_map.i['p'] = 'Evil ex path'
    let g:which_key_map.i['t'] = 'Toilet pagga'
endif

" nnoremap <silent> <leader>if :normal "%p<cr>
nnoremap <silent> <leader>if a<C-r>=expand("%:t")<cr><esc>
nnoremap <silent> <leader>iF a<C-r>=expand("%:p")<cr><esc>
nnoremap <leader>ip :r !echo 
nnoremap <leader>it :r !toilet -f pagga

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.o      = { 'name' : '+open' }
    let g:which_key_map.o['-'] = 'Netrw'
    let g:which_key_map.o['b'] = 'Default browser'
    let g:which_key_map.o['o'] = 'Reveal in finder'
    let g:which_key_map.o['t'] = 'Toggle term popup'
endif

nnoremap <silent> <leader>o- :Explore<cr>
nnoremap <silent> <leader>ob <Plug>NetrwBrowseX
nnoremap <silent> <leader>oo :call Reveal_In_Files()<cr>
nnoremap <silent> <leader>ot :term<cr>

if has_key(plugs, 'coc.nvim')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.o['p'] = 'Project sidebar'
        " let g:which_key_map.o['P'] = 'Find file in project sidebar'
    endif

    nnoremap <leader>op :CocCommand explorer<cr>
endif

if has_key(plugs, 'vim-floaterm')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.o['-'] = 'Vifm'
    endif

    nnoremap <silent> <leader>ot :FloatermToggle<cr>
    nnoremap <silent> <leader>o- :FloatermNew --wintype='float' --width=0.99 --height=0.99 vifm<cr>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.p = { 'name' : '+project' }
endif

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.p['f'] = 'Find file in project'
    endif

    nnoremap <leader>pf :GFiles<cr>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.q      = { 'name' : '+quit/session' }
    let g:which_key_map.q['l'] = 'Restore last session'
    let g:which_key_map.q['L'] = 'Restore session from file'
    let g:which_key_map.q['q'] = 'Quit Vim'
    let g:which_key_map.q['Q'] = 'Quit Vim without saving'
    let g:which_key_map.q['s'] = 'Quick save current session'
    let g:which_key_map.q['S'] = 'Save session to file'
endif

nnoremap <silent> <leader>ql :source $HOME/.vim/.local/etc/workspaces/quick-session.vim<cr>
nnoremap <silent> <leader>qL :source $HOME/.vim/.local/etc/workspaces/
nnoremap <silent> <leader>qq :qa<cr>
nnoremap <silent> <leader>qQ :qa!<cr>
nnoremap <silent> <leader>qs :mksession! $HOME/.vim/.local/etc/workspaces/quick-session.vim<cr>
nnoremap <silent> <leader>qS :mksession $HOME/.vim/.local/etc/workspaces/

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.s = { 'name' : '+search' }
endif

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.s['b'] = 'Search buffer'
        let g:which_key_map.s['B'] = 'Search all open buffers'
        let g:which_key_map.s['p'] = 'Search project'
        let g:which_key_map.s['r'] = 'Jump to mark'
        let g:which_key_map.s['t'] = 'Search Tags in buffer'
        let g:which_key_map.s['T'] = 'Search Tags in all buffers'
    endif
    
    nnoremap <leader>sb :BLines<CR>
    nnoremap <leader>sB :Lines<CR>
    nnoremap <leader>sp :Rg<CR>
    nnoremap <leader>sr :Marks<CR>
    nnoremap <leader>st :BTags<CR>
    nnoremap <leader>sT :Tags<CR>
    
    " let g:which_key_map.s['/'] = 'Search history'
    " let g:which_key_map.s[':'] = 'Commands history'
    " let g:which_key_map.s['c'] = 'Search all commands'

"     nnoremap <silent> <leader>s/ :History/<CR>
"     nnoremap <silent> <leader>s: :History:<CR>
"     nnoremap <silent> <leader>sc :Commands<CR>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.t      = { 'name' : '+toggle' }
    let g:which_key_map.t['l'] = 'Line numbers'
    let g:which_key_map.t['p'] = 'Paste mode'
    let g:which_key_map.t['w'] = 'Soft line wrapping'
    let g:which_key_map.t['r'] = 'Read-only mode'
    let g:which_key_map.t['s'] = 'Spell checker'
    let g:which_key_map.t['|'] = 'Fill column indicator'
endif

nnoremap <leader>tl :call Cycle_LineNumbers()<cr>
nnoremap <leader>tp :call Toggle_Mode('paste'   , 'Paste mode enabled in current buffer'      , 'Paste mode disabled in current buffer')<cr>
nnoremap <leader>tw :call Toggle_Mode('wrap'    , 'Visual-Line mode enabled in current buffer', 'Visual-Line mode disabled in current buffer')<cr>
nnoremap <leader>tr :call Toggle_Mode('readonly', 'Read-Only mode enabled in current buffer'  , 'Read-Only mode disabled in current buffer')<cr>
nnoremap <leader>ts :call Toggle_Mode('spell'   , 'Spell mode enabled in current buffer'      , 'Spell mode disabled in current buffer')<cr>
nnoremap <leader>t\| :call Toggle_FillColumn()<cr>

if has_key(plugs, 'vim-minimap')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.t['m']      = 'Minimap'
        let g:which_key_map.t['M']      = { 'name' : '+minimap...' }
        let g:which_key_map.t['M']['c'] = 'Close minimap'
        let g:which_key_map.t['M']['o'] = 'Open minimap'
        let g:which_key_map.t['M']['u'] = 'Update minimap'
    endif
    
    let g:minimap_show='<leader>tMo'
    let g:minimap_update='<leader>tMu'
    let g:minimap_close='<leader>tMc'
    let g:minimap_toggle='<leader>tm'
endif

if has_key(plugs, 'Colorizer')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.t['c'] = 'Colors'
    endif

    nnoremap <leader>tc :call Toggle_Rainbow()<cr>
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.w      = { 'name' : '+window' }
    let g:which_key_map.w['+'] = 'Window increase height'
    let g:which_key_map.w['-'] = 'Window decrease height'
    let g:which_key_map.w['<'] = 'Window decrease width'
    let g:which_key_map.w['='] = 'Balance windows'
    let g:which_key_map.w['>'] = 'Window increase width'
    let g:which_key_map.w['_'] = 'Window set height'
    " let g:which_key_map.w['`'] = 'Open a terminal in a split'
    let g:which_key_map.w['b'] = 'Window bottom right'
    let g:which_key_map.w['c'] = 'Window delete'
    let g:which_key_map.w['d'] = 'Window delete'
    let g:which_key_map.w['h'] = 'Window left'
    let g:which_key_map.w['H'] = 'Window move left'
    let g:which_key_map.w['j'] = 'Window down'
    let g:which_key_map.w['J'] = 'Window move down'
    let g:which_key_map.w['k'] = 'Window up'
    let g:which_key_map.w['K'] = 'Window move up'
    let g:which_key_map.w['l'] = 'Window right'
    let g:which_key_map.w['L'] = 'Window move right'
    let g:which_key_map.w['n'] = 'Window new'
    let g:which_key_map.w['o'] = 'Window enlargen'
    let g:which_key_map.w['p'] = 'Window previous'
    let g:which_key_map.w['q'] = 'Quit'
    let g:which_key_map.w['r'] = 'Window rotate downwards'
    let g:which_key_map.w['R'] = 'Window rotate upwards'
    let g:which_key_map.w['s'] = 'Window split'
    let g:which_key_map.w['S'] = 'Window split and follow'
    let g:which_key_map.w['t'] = 'Window top left'
    let g:which_key_map.w['T'] = 'Tear off window'
    " let g:which_key_map.w['u'] = 'Winner undo'
    let g:which_key_map.w['v'] = 'Window vsplit'
    let g:which_key_map.w['V'] = 'Window vsplit and follow'
    let g:which_key_map.w['w'] = 'Window next'
    let g:which_key_map.w['W'] = 'Window prev'
    let g:which_key_map.w['|'] = 'Window set width'
endif

nnoremap <leader>w+ :resize +5<cr>
nnoremap <leader>w- :resize -5<cr>
nnoremap <leader>w< :vertical resize -5<cr>
nnoremap <leader>w= <C-w>=
nnoremap <leader>w> :vertical resize +5<cr>
nnoremap <leader>w_ :resize<cr>
nnoremap <leader>wb <C-w>b
nnoremap <leader>wc :close<cr>
nnoremap <leader>wd :close<cr>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wH <C-w>H
nnoremap <leader>wj <C-w>j
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wk <C-w>k
nnoremap <leader>wK <C-w>K
nnoremap <leader>wl <C-w>l
nnoremap <leader>wL <C-w>L
nnoremap <leader>wn :new<cr>
nnoremap <leader>wo :only<cr>
nnoremap <leader>wp <C-w>p
nnoremap <leader>wq :quit<cr>
nnoremap <leader>wr <C-w>r
nnoremap <leader>wR <C-w>R
nnoremap <leader>ws :split<cr><C-w>p
nnoremap <leader>wS :split<cr>
nnoremap <leader>wt <C-w>t
nnoremap <leader>wT <C-w>T
nnoremap <leader>wv :vsplit<cr><C-w>p
nnoremap <leader>wV :vsplit<cr>
nnoremap <leader>ww <C-w>w
nnoremap <leader>wW <C-w>W
nnoremap <leader>w\| :vertical resize<cr>

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.w.m = { 'name' : '+maximize' }
endif

if has_key(plugs, 'vim-which-key')
    let g:g_map['#']      = 'Ex search unbounded word backward'
    let g:g_map['$']      = 'End of visual line'
    let g:g_map['&']      = 'Ex repeat substitute'
    let g:g_map['*']      = 'Ex search unbounded word forward'
    let g:g_map[',']      = 'Goto last change reverse'
    let g:g_map['-']      = '+number Dec at point'
    let g:g_map['0']      = 'Beginning of visual line'
    let g:g_map['8']      = 'What cursor position'
    let g:g_map[';']      = 'Goto last change'
    let g:g_map['=']      = '+number Inc at point'
    let g:g_map['?']      = 'Rot13'
    " let g:g_map['@']      = 'Apply macro'
    let g:g_map['^']      = 'First non blank of visual line'
    let g:g_map['_']      = 'Last non blank'
    let g:g_map['a']      = 'What cursor position'
    let g:g_map['d']      = '+lookup Definition'
    let g:g_map['e']      = 'Backward word end'
    let g:g_map['E']      = 'Backward WORD end'
    let g:g_map['f']      = '+lookup File'
    let g:g_map['F']      = 'Find file at point with line'
    let g:g_map['g']      = 'Goto first line'
    let g:g_map['i']      = 'Insert resume'
    let g:g_map['j']      = 'Next visual line'
    let g:g_map['J']      = 'Join whitespace'
    let g:g_map['k']      = 'Previous visual line'
    let g:g_map['l']      = 'Lion left'
    let g:g_map['L']      = 'Lion right'
    let g:g_map['m']      = 'Middle of visual line'
    let g:g_map['M']      = 'Percentage of line'
    let g:g_map['n']      = 'Next match'
    let g:g_map['N']      = 'Previous match'
    let g:g_map['o']      = 'Goto char'
    " let g:g_map['p']      = 'Reselect paste'
    let g:g_map['q']      = 'Fill and move'
    " let g:g_map['Q']      = '+format Region'
    " let g:g_map['r']      = '+eval Region'
    " let g:g_map['R']      = '+eval/buffer'
    let g:g_map['t']      = '+workspace Switch next '
    let g:g_map['T']      = '+workspace Switch previous'
    let g:g_map['u']      = 'Downcase'
    let g:g_map['U']      = 'Upcase'
    let g:g_map['v']      = 'Visual restore'
    let g:g_map['w']      = 'Fill'
    " let g:g_map['y']      = 'Yank unindented'
    let g:g_map['~']      = 'Invert case'
    " let g:g_map['<C-]>']  = 'Projectile find tag'
    " let g:g_map['<C-g>']  = 'Count words'
    let g:g_map['<Down>'] = 'Next visual line'
    let g:g_map['<End>']  = 'End of visual line'
    let g:g_map['<Home>'] = 'First non blank of visual line'
    let g:g_map['<Up>']   = 'Previous visual line'
endif

map g# g#
map g$ g$
map g& g&
map g* g*
map g, g,
map g- <C-x>
map g0 g0
map g8 g8
map g; g;
map g= <C-a>
map g? g?
map g^ g^
map g_ g_
map ga ga
map gd gd
map ge ge
map gE gE
map gf gf
map gF gF
map gg gg
map gi gi
map gj gj
map gJ gJ
map gk gk
map gl gl
map gL gL
map gm gm
map gM gM
map gn gn
map gN gN
map go go
map gq gq
map gt gt
map gT gT
map gu gu
map gU gU
map gv gv
map gw gw
map g~ g~
map g<Down> g<Down>
map g<End> g<End>
map g<Home> g<Home>
map g<Up> g<Up>

if has_key(plugs, 'vim-exchange')
    if has_key(plugs, 'vim-which-key')
        let g:g_map['x']  = 'Exchange'
        let g:g_map['xx'] = 'which_key_ignore'
        let g:g_map['xc'] = 'which_key_ignore'
    endif

    nmap gx <Plug>(Exchange)
    nmap gxx <Plug>(ExchangeLine)
    nmap gxc <Plug>(ExchangeClear)
    xmap gx <Plug>(Exchange)
endif

if has_key(plugs, 'coc.nvim')
    if has_key(plugs, 'vim-which-key')
        " let g:g_map['A'] = '+lookup Assignments'
        let g:g_map['d'] = '+lookup Definition'
        let g:g_map['D'] = '+lookup References'
        let g:g_map['I'] = '+lookup Implementations'
    endif

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gD <Plug>(coc-references)
    nmap <silent> gI <Plug>(coc-implementation)
endif

if has_key(plugs, 'vim-commentary')
    if has_key(plugs, 'vim-which-key')
        let g:g_map['c']  = 'Comment operator'
        let g:g_map['cc'] = 'which_key_ignore'
    endif

    " map gc gc
endif

if has_key(plugs, 'ReplaceWithRegister')
    if has_key(plugs, 'vim-which-key')
        let g:g_map['r']  = '? Replace with register'
        let g:g_map['rr'] = 'which_key_ignore'
    endif
endif

" if has_key(plugs, 'vim-which-key')
"     let g:g_map.s = '+prefix' 
" endif

if has_key(plugs, 'vim-which-key')
    let g:z_map['<CR>'] = 'Scroll line to top'
    let g:z_map['+']    = 'Scroll bottom line to top'
    let g:z_map['-']    = 'Scroll line to bottom'
    let g:z_map['.']    = 'Scroll line to center'
    let g:z_map['=']    = '+spell ispell word'
    let g:z_map['^']    = 'Scroll top line to bottom'
    let g:z_map['a']    = 'Toggle fold'
    let g:z_map['b']    = 'Scroll line to bottom'
    let g:z_map['c']    = 'Close fold'
    let g:z_map['d']    = 'Fold delete'
    let g:z_map['D']    = 'Fold delete all'
    let g:z_map['f']    = 'Fold create'
    let g:z_map['F']    = 'Fold create line'
    let g:z_map['g']    = '+spell Add word'
    let g:z_map['h']    = 'Scroll column left'
    let g:z_map['H']    = 'Scroll left'
    let g:z_map['i']    = 'Fold invert'
    let g:z_map['j']    = 'Fold next'
    let g:z_map['k']    = 'Fold previous'
    let g:z_map['l']    = 'Scroll column right'
    let g:z_map['L']    = 'Scroll right'
    let g:z_map['m']    = 'Close folds'
    let g:z_map['n']    = 'Fold none'
    let g:z_map['N']    = 'Fold normal'
    let g:z_map['o']    = 'Open fold'
    let g:z_map['O']    = 'Open fold rec'
    let g:z_map['r']    = 'Open folds'
    let g:z_map['t']    = 'Scroll line to top'
    let g:z_map['w']    = '+spell Remove word'
    let g:z_map['x']    = 'Update folds'
    let g:z_map['X']    = 'Undo folds'
    let g:z_map['z']    = 'Scroll line to center'
endif

map z= z=
map za za
map zc zc
map zd zd
map zD zD
map zf zf
map zF zF
map zg zg
map zh zh
map zH zH
map zi zi
map zj zj
map zk zk
map zl zl
map zL zL
map zm zm
map zn zn
map zN zN
map zo zo
map zO zO
map zr zr
map zw zw
map zx zx
map zX zX

if has_key(plugs, 'vim-which-key')
    let g:Z_map['Q'] = 'Vim quit'
    let g:Z_map['X'] = 'Save and kill buffer'
    let g:Z_map['Z'] = 'Save modified and close'
endif

map ZQ ZQ
map ZX :w <Bar> Bclose<cr>
map ZZ ZZ

if has_key(plugs, 'vim-which-key')
    let g:l_sqr_bracket_map['"'] = 'which_key_ignore'
    let g:l_sqr_bracket_map[' '] = ['[o', 'Insert newline above']
    " let g:l_sqr_bracket_map['#'] = 'Previous preproc directive'
    " let g:l_sqr_bracket_map["'"] = 'Previous mark line'
    let g:l_sqr_bracket_map['('] = 'Previous open paren'
    let g:l_sqr_bracket_map['['] = 'Backward section end'
    let g:l_sqr_bracket_map[']'] = 'Backward section begin'
    " let g:l_sqr_bracket_map['`'] = 'Previous mark'
    " let g:l_sqr_bracket_map['a'] = 'Backward arg'
    let g:l_sqr_bracket_map['b'] = 'Previous buffer'
    let g:l_sqr_bracket_map['c'] = 'Previous comment'
    " let g:l_sqr_bracket_map['f'] = 'Previous file'
    " let g:l_sqr_bracket_map['h'] = 'Outline previous visible heading'
    " let g:l_sqr_bracket_map['m'] = 'Previous beginning of method'
    " let g:l_sqr_bracket_map['M'] = 'Previous end of method'
    let g:l_sqr_bracket_map['o'] = 'Insert newline above'
    let g:l_sqr_bracket_map['s'] = '+spell Previous error'
    " let g:l_sqr_bracket_map['t'] = 'Hl todo previous'
    " let g:l_sqr_bracket_map['u'] = 'Url decode'
    let g:l_sqr_bracket_map['w'] = '+workspace Switch left'
    " let g:l_sqr_bracket_map['y'] = 'C string decode'
    let g:l_sqr_bracket_map['{'] = 'Previous open brace'
endif

if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['"'] = 'which_key_ignore'                 | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map[' '] = [']o', 'Insert newline below']     | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['#'] = 'Next preproc directive'           | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map["'"] = 'Next mark line'                   | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map[')'] = 'Next close paren'                 | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['['] = 'Forward section end'              | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map[']'] = 'Forward section begin'            | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['`'] = 'Next mark'                        | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['a'] = 'Forward arg'                      | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['b'] = 'Next buffer'                      | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['c'] = 'Next comment'                     | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['f'] = 'Next file'                        | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['h'] = 'Outline next visible heading'     | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['m'] = 'Next beginning of method'         | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['M'] = 'Next end of method'               | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['o'] = 'Insert newline below'             | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['s'] = '+spell Next error'                | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['t'] = 'Hl todo next'                     | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['u'] = 'Url encode'                       | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['w'] = '+workspace Switch right'          | endif
" if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['y'] = 'C string encode'                  | endif
if has_key(plugs, 'vim-which-key') | let g:r_sqr_bracket_map['}'] = 'Next close brace'                 | endif

nmap <silent> [<Space> [o
nmap <silent> ]<Space> ]o
nmap <silent> [b :bprevious<cr>
nmap <silent> ]b :bnext<cr>
nmap ]c ]"
nmap [c ["
nmap <silent> [o :call append(line('.')-1, '')<cr>
nmap <silent> ]o :call append(line('.'), '')<cr>
nmap [s [s
nmap ]s ]s
nmap <silent> [w :tabprevious<cr>
nmap <silent> ]w :tabnext<cr>
nmap [{ [{
nmap ]} ]}

if has_key(plugs, 'vim-gitgutter')
    if has_key(plugs, 'vim-which-key')
        let g:l_sqr_bracket_map.d = '+git Previous hunk'
        let g:r_sqr_bracket_map.d = '+git Next hunk'
    endif
    
    nmap [d <Plug>(GitGutterPrevHunk)
    nmap ]d <Plug>(GitGutterNextHunk)
endif

if has_key(plugs, 'coc.nvim')
    if has_key(plugs, 'vim-which-key')
        let g:l_sqr_bracket_map['e'] = 'Previous error'
        let g:r_sqr_bracket_map['e'] = 'Next error'
    endif
    
    nmap <silent> [e <Plug>(coc-diagnostic-prev)
    nmap <silent> ]e <Plug>(coc-diagnostic-next)
endif

nnoremap <Up> :blast<cr>
nnoremap <Down> :bfirst<cr>
nnoremap <Left> :bprevious<cr>
nnoremap <Right> :bnext<cr>

noremap <tab> :norm za<cr>
noremap <tab><tab> :norm zA<cr>
noremap <S-tab> :norm zR<cr>
noremap <S-tab><S-tab> :norm zM<cr>

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

map <A-x> :

nnoremap <A-k> :m-2<cr>==
nnoremap <A-j> :m+<cr>==
vnoremap <A-k> :m '<-2<cr>gv=gv
vnoremap <A-j> :m '>+1<cr>gv=gv

if has_key(plugs, 'coc.nvim')
    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <C-s> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
endif

if has_key(plugs, 'vim-which-key')
    let g:which_key_map.m = { 'name' : '+<localleader>' }
endif

if has_key(plugs, 'fzf')
    if has_key(plugs, 'vim-which-key')
        let g:which_key_map.m['M'] = 'Switch major mode'
    endif

    nnoremap <silent> <leader>mM :Filetypes<CR>
endif

if has_key(plugs, 'vim-gitgutter')
    " Select current hunk
    omap ic <Plug>(GitGutterTextObjectInnerPending)
    omap ac <Plug>(GitGutterTextObjectOuterPending)
    xmap ic <Plug>(GitGutterTextObjectInnerVisual)
    xmap ac <Plug>(GitGutterTextObjectOuterVisual)
endif

if has_key(plugs, 'coc.nvim')
    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    " xmap <leader>x  <Plug>(coc-convert-snippet)
    " let g:which_key_map['x'] = 'Convert to snippet'
endif
