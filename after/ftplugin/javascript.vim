function! JavaScriptFold() 
  setlocal foldmethod=syntax
  setlocal foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setlocal foldtext=FoldText()
endfunction

call JavaScriptFold()

setlocal fen
setlocal nocindent

imap <C-t> $log();<esc>hi
imap <C-a> alert();<esc>hi

inoremap <buffer> $r return 
inoremap <buffer> $f // --- PH<esc>FP2xi

