nnoremap <silent> <leader><Esc> :nohlsearch<cr>
map <leader>< :BufExplorerHorizontalSplit<cr>
map <leader>` :b#<cr>

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



map <leader>fc :cd %:p:h<cr>:pwd<cr>
map <leader>fs :write<cr>
map <leader>fS :write
map <leader>fv :vimgrep **/*





map <leader>hre :source $MYVIMRC<cr>
map <leader>hrr :source %<cr>







map <leader>ql :source $HOME/.vim/sessions/quick-session.vim<cr>
map <leader>qL :source $HOME/.vim/sessions/
map <leader>qq :qa<cr>
map <leader>qQ :qa!<cr>
map <leader>qs :mksession! $HOME/.vim/sessions/quick-session.vim<cr>
map <leader>qS :mksession $HOME/.vim/sessions/



map <leader>tp :setlocal paste!<cr>
map <leader>ts :setlocal spell!<cr>
map <leader>it :r !toilet -f pagga

map <leader>w` :term<cr>

map <leader>w+ :resize +5<cr>
map <leader>w- :resize -5<cr>
map <leader>w< :vertical resize -5<cr>
map <leader>w> :vertical resize +5<cr>
map <leader>w= <C-w>=
map <leader>w_ :resize<cr>
map <leader>w\| :vertical resize<cr>

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

map <A-x> :

nnoremap <Up> :blast<cr>
nnoremap <Down> :bfirst<cr>
nnoremap <Left> :bprevious<cr>
nnoremap <Right> :bnext<cr>

noremap g= <C-a>
noremap g- <C-x>

noremap <tab> :norm za<cr>
noremap <tab><tab> :norm zA<cr>
noremap <S-tab> :norm zR<cr>
noremap <S-tab><S-tab> :norm zM<cr>

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

nnoremap <A-k> :m-2<cr>==
nnoremap <A-j> :m+<cr>==
vnoremap <A-k> :m '<-2<cr>gv=gv
vnoremap <A-j> :m '>+1<cr>gv=gv
