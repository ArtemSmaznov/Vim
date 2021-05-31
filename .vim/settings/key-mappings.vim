"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings that are specific to plugins are defined per plugin under 'plug-configs' directory
"
" Sections:
"    -> General
"    -> File navigation
"    -> Workspace navigation
"    -> Spell checking
"    -> Tabs, windows and buffer
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Source current file
nnoremap <leader>r :source %<cr>

" Toggle paste mode on and off
map <leader>sp :setlocal paste!<cr>

" Disable search highlight
map <silent> <leader><leader> :noh<cr>


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

" Join line with space in between with gj and no space with gJ
" noremap gj J " gj is actually used for wrapped line navigation

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Workspace navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>fv :vimgrep 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs, windows and buffers
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

" Open Terminal
nnoremap <leader>` :term<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Working with buffers

" Close the current buffer
map <leader>bc :Bclose<cr>
" map <leader>bd :Bclose<cr>:tabclose<cr>gT 

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" First buffer
map <leader>bj :bfirst<cr>
nnoremap <Down> :bfirst<cr>

" Previous buffer
map <leader>bh :bprevious<cr>
nnoremap <Left> :bprevious<cr>

" Next buffer
map <leader>bl :bnext<cr>
nnoremap <Right> :bnext<cr>

" Last buffer
map <leader>bk :blast<cr>
nnoremap <Up> :blast<cr>

" Switch CWD to the directory of the open buffer
map <leader>bd :cd %:p:h<cr>:pwd<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ek :e! $HOME/.vim/settings/key-mappings.vim<cr>
autocmd! bufwritepost $HOME/.vim/settings/key-mappings.vim source $HOME/.vim/settings/key-mappings.vim
