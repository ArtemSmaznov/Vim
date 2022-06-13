autocmd BufNewFile,BufRead,BufEnter * setlocal fo-=cro

if !has("mac") || !has("macunix")
  set diffopt+=vertical
endif

noremap <C-e> 4<C-e>
noremap <C-y> 4<C-y>

set so=7

set spelllang=en_us,ru_ru

" set background=dark
colorscheme gruvbox8

try
  source $HOME/.vim/after/vimrc
catch
endtry
