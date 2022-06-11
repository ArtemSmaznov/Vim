autocmd BufNewFile,BufRead,BufEnter * setlocal fo-=cro

if !has("mac") || !has("macunix")
  set diffopt+=vertical
endif

noremap <C-e> 4<C-e>
noremap <C-y> 4<C-y>

set so=7

set background=dark
colorscheme gruvbox8

set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*,**\node_modules\**
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,**/node_modules/**,*/.DS_Store
endif

try
  source $HOME/.vim/after/vimrc
catch
endtry
