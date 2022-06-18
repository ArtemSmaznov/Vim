" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | q | source $MYVIMRC
  \| endif

call plug#begin('$HOME/.vim/.local/straight/repos')

" Core
Plug 'junegunn/vim-plug'
Plug 'tommcdo/vim-lion'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-commentary'                     " Plugin for commenting code
Plug 'tpope/vim-surround'                       " Plugin for deleting, changing, and adding surroundings
Plug 'jiangmiao/auto-pairs'                     " Insert or delete brackets, parens, quotes in pair
Plug 'justinmk/vim-sneak'
Plug 'tommcdo/vim-exchange'

" LSP
if has("python3")
    Plug 'neoclide/coc.nvim', {'branch': 'release'}        " LSP support for Vim & Neovim
endif
Plug 'severin-lemaignan/vim-minimap'
Plug 'chrisbra/Colorizer',

" File Types
Plug 'tpope/vim-cucumber'        , { 'for': 'cucumber' }
Plug 'pangloss/vim-javascript'   , { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown'   , { 'for': 'markdown' }
Plug 'rust-lang/rust.vim'        , { 'for': 'rust' }
Plug 'cespare/vim-toml'          , { 'for': 'toml' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" UI
Plug 'psliwka/vim-smoothie' " Smooth scrolling
Plug 'ryanoasis/vim-devicons'

" Themes
Plug 'lifepillar/vim-gruvbox8'

" ======> Text <======
Plug 'terryma/vim-expand-region'                " Incremental visual selection
Plug 'michaeljsmith/vim-indent-object'          " Text objests based on indent levels
" Plug 'maxbrunsfeld/vim-yankstack'               " Plugin for storing and cycling through yanked text strings
Plug 'tpope/vim-repeat'                         " Repeat.vim remaps `.` in a way that plugins can tap into it
Plug 'honza/vim-snippets'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
" Plug 'vimwiki/vimwiki'

" ======> Navigation <======
" Plug 'mileszs/ack.vim'                          " Plugin that integrates ack with Vim
" Plug 'ctrlpvim/ctrlp.vim'                       " Fuzzy file, buffer, mru, tag, ... finder
Plug 'szw/vim-tags'
Plug 'jlanzarotta/bufexplorer'                  " Buffer Explorer
Plug 'farmergreg/vim-lastplace'                 " Intelligently reopen files where you left off
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ======> Other <======
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'                   " A Vim plugin which shows a git diff in the gutter
Plug 'tpope/vim-fugitive'                       " A Git wrapper so awesome, it should be illegal
Plug 'voldikss/vim-floaterm'

" New Plugins to try
" Plug 'airblade/vim-rooter'

call plug#end()
