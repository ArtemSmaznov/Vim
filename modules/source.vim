" DONE
if has_key(plugs, 'Colorizer')       | source $HOME/.vim/modules/Colorizer/config.vim       | endif
if has_key(plugs, 'buffexplorer')    | source $HOME/.vim/modules/buffexplorer/config.vim    | endif
if has_key(plugs, 'tmuxline.vim')    | source $HOME/.vim/modules/tmuxline.vim/config.vim    | endif
if has_key(plugs, 'vimwiki')         | source $HOME/.vim/modules/vimwiki/config.vim         | endif
if has_key(plugs, 'vim-airline')     | source $HOME/.vim/modules/vim-airline/config.vim     | endif
if has_key(plugs, 'vim-system-copy') | source $HOME/.vim/modules/vim-system-copy/config.vim | endif
if has_key(plugs, 'vim-tags')        | source $HOME/.vim/modules/vim-tags/config.vim        | endif
if has_key(plugs, 'auto-pairs')      | source $HOME/.vim/modules/auto-pairs/config.vim      | endif
if has_key(plugs, 'vim-sneak')       | source $HOME/.vim/modules/vim-sneak/config.vim       | endif
if has_key(plugs, 'vim-exchange')    | source $HOME/.vim/modules/vim-exchange/config.vim    | endif
if has_key(plugs, 'vim-gitgutter')   | source $HOME/.vim/modules/vim-gitgutter/config.vim   | endif

" TODO
if has_key(plugs, 'vim-which-key')   | source $HOME/.vim/modules/vim-which-key/config.vim   | endif
if has_key(plugs, 'vim-floaterm')    | source $HOME/.vim/modules/vim-floaterm/config.vim    | endif
if has_key(plugs, 'fzf.vim')         | source $HOME/.vim/modules/fzf.vim/config.vim         | endif

" disabled
if has_key(plugs, 'ack.vim')         | source $HOME/.vim/modules/ack.vim/config.vim         | endif
if has_key(plugs, 'coc.nvim')        | source $HOME/.vim/modules/coc.nvim/config.vim        | endif
if has_key(plugs, 'ctrlp.vim')       | source $HOME/.vim/modules/ctrlp.vim/config.vim       | endif
if has_key(plugs, 'vim-yankstack')   | source $HOME/.vim/modules/vim-yankstack/config.vim   | endif
