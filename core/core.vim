filetype plugin on
filetype indent on

syntax enable

let g:mapleader = " "
let g:maplocalleader = " m"

let workspaces=$"{vim_dir}/.local/etc/workspaces"
let autosave=$"{workspaces}/autosave"
let viminfo=expand($"{workspaces}/_viminfo")

let undodir=$"{vim_dir}/.local/etc/transient/undodir"

" Location for cache files for =NetRW=
let g:netrw_home=$"{vim_dir}/.local/cache"

execute $"source {vim_dir}/packages.vim"
execute $"source {vim_dir}/core/core-utils.vim"
execute $"source {vim_dir}/modules/source.vim"
execute $"source {vim_dir}/core/core-editor.vim"
execute $"source {vim_dir}/core/core-ui.vim"
execute $"source {vim_dir}/core/core-keybindings.vim"
