filetype plugin on
filetype indent on

syntax enable

let g:mapleader = " "
let g:maplocalleader = " m"

let vim_dir="$HOME/.vim"
let workspaces=$"{vim_dir}/.local/etc/workspaces"
let autosave=$"{workspaces}/autosave"
let viminfo=expand($"{workspaces}/_viminfo")

source $HOME/.vim/packages.vim
source $HOME/.vim/core/core-utils.vim
source $HOME/.vim/modules/source.vim
source $HOME/.vim/core/core-editor.vim
source $HOME/.vim/core/core-ui.vim
source $HOME/.vim/core/core-keybindings.vim
