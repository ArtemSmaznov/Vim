" DONE
if has_key(plugs, 'Colorizer')       | execute $"source {vim_dir}/modules/Colorizer/config.vim"       | endif
if has_key(plugs, 'buffexplorer')    | execute $"source {vim_dir}/modules/buffexplorer/config.vim"    | endif
if has_key(plugs, 'tmuxline.vim')    | execute $"source {vim_dir}/modules/tmuxline.vim/config.vim"    | endif
if has_key(plugs, 'vimwiki')         | execute $"source {vim_dir}/modules/vimwiki/config.vim"         | endif
if has_key(plugs, 'vim-airline')     | execute $"source {vim_dir}/modules/vim-airline/config.vim"     | endif
if has_key(plugs, 'vim-system-copy') | execute $"source {vim_dir}/modules/vim-system-copy/config.vim" | endif
if has_key(plugs, 'vim-tags')        | execute $"source {vim_dir}/modules/vim-tags/config.vim"        | endif
if has_key(plugs, 'auto-pairs')      | execute $"source {vim_dir}/modules/auto-pairs/config.vim"      | endif
if has_key(plugs, 'vim-sneak')       | execute $"source {vim_dir}/modules/vim-sneak/config.vim"       | endif
if has_key(plugs, 'vim-exchange')    | execute $"source {vim_dir}/modules/vim-exchange/config.vim"    | endif
if has_key(plugs, 'vim-gitgutter')   | execute $"source {vim_dir}/modules/vim-gitgutter/config.vim"   | endif

" TODO
if has_key(plugs, 'vim-which-key')   | execute $"source {vim_dir}/modules/vim-which-key/config.vim"   | endif
if has_key(plugs, 'vim-floaterm')    | execute $"source {vim_dir}/modules/vim-floaterm/config.vim"    | endif
if has_key(plugs, 'fzf.vim')         | execute $"source {vim_dir}/modules/fzf.vim/config.vim"         | endif

" disabled
if has_key(plugs, 'ack.vim')         | execute $"source {vim_dir}/modules/ack.vim/config.vim"         | endif
if has_key(plugs, 'coc.nvim')        | execute $"source {vim_dir}/modules/coc.nvim/config.vim"        | endif
if has_key(plugs, 'ctrlp.vim')       | execute $"source {vim_dir}/modules/ctrlp.vim/config.vim"       | endif
if has_key(plugs, 'vim-yankstack')   | execute $"source {vim_dir}/modules/vim-yankstack/config.vim"   | endif
