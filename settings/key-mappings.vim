"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings that are specific to plugins are defined per plugin under 'plug-configs' directory
"
" Sections:
"    -> General
"    -> Buffers
"    -> Windows
"    -> Tabs
"    -> Edit config
"    -> File navigation
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Disable search highlight
map <silent> <leader><leader> :noh<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>< :BufExplorerHorizontalSplit<cr>

" b group
map <leader>b[ :bprevious<cr>
map <leader>b] :bnext<cr>
map <leader>bd :Bclose<cr>
map <leader>bk :Bclose<cr>
map <leader>bK :bufdo bd<cr>
map <leader>bn :bnext<cr>
map <leader>bN :tabe<cr>
map <leader>bp :bprevious<cr>
map <leader>bl :BufExplorerHorizontalSplit<cr>

" Arrows
nnoremap <Up> :blast<cr>
nnoremap <Down> :bfirst<cr>
nnoremap <Left> :bprevious<cr>
nnoremap <Right> :bnext<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Resize windows
noremap <leader>= :resize +5<CR>
noremap <leader>- :resize -5<CR>
noremap <leader>, :vertical:resize -5<CR>
noremap <leader>. :vertical:resize +5<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful mappings for managing tabs
map <leader>ttn :tabnew<cr>
map <leader>tto :tabonly<cr>
map <leader>ttc :tabclose<cr>
map <leader>ttm :tabmove 
map <leader>tt<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>ttl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Edit config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim
map <leader>fevr :e! $HOME/.vim/vimrc<cr>
map <leader>fevb :e! $HOME/.vim/settings/basic.vim<cr>
map <leader>fevp :e! $HOME/.vim/settings/plugins.vim<cr>
map <leader>fevu :e! $HOME/.vim/settings/ui.vim<cr>
map <leader>fevk :e! $HOME/.vim/settings/key-mappings.vim<cr>
map <leader>fevw :e! $HOME/.vim/settings/plugins/which-key.vim<cr>

" qTile
map <leader>feqb :e! $HOME/.config/qtile/lib/bars.py<cr>
map <leader>feqg :e! $HOME/.config/qtile/settings/groups.py<cr>
map <leader>feqk :e! $HOME/.config/qtile/keys/bindings.py<cr>
map <leader>feql :e! $HOME/.config/qtile/settings/layouts.py<cr>
map <leader>feqt :e! $HOME/.config/qtile/theme/default.py<cr>
map <leader>feqw :e! $HOME/.config/qtile/lib/widgets/general.py<cr>

" Dotfiles
map <leader>fedb :e! $HOME/.bashrc<cr>
map <leader>fedz :e! $HOME/.zshrc<cr>
map <leader>feda :e! $HOME/.config/aliasrc<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Move a line of text using Shift+j/k in all modes 
nnoremap K :m-2<cr>==
nnoremap J :m+<cr>==
vnoremap K :m '<-2<cr>gv=gv
vnoremap J :m '>+1<cr>gv=gv

" Increase/Decrease numbers
noremap g- <C-x>
noremap g= <C-a>

" Folds
noremap <tab> :norm za<cr>
noremap <tab><tab> :norm zA<cr>
noremap <S-tab> :norm zR<cr>
noremap <S-tab><S-tab> :norm zM<cr>

