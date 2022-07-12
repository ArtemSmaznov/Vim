" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | q | source $MYVIMRC
  \| endif

call plug#begin($"{g:vim_dir}/.local/straight/repos")

" Core
Plug 'junegunn/vim-plug'                                   " A minimalist Vim plugin manager
Plug 'tommcdo/vim-lion'                                    " Plugin to define a code alignment operator
Plug 'liuchengxu/vim-which-key'                            " Displays available keybindings in popup
Plug 'tpope/vim-commentary'                                " Comment stuff out
Plug 'tpope/vim-surround'                                  " Plugin for deleting, changing, and adding surroundings
Plug 'jiangmiao/auto-pairs'                                " Insert or delete brackets, parens, quotes in pair
Plug 'justinmk/vim-sneak'                                  " Motion improved
Plug 'tommcdo/vim-exchange'                                " Plugin to define a text exchange operator
Plug 'tpope/vim-repeat'                                    " Repeat.vim remaps `.` in a way that plugins can tap into it
Plug 'christoomey/vim-system-copy'                         " Copy / Paste text to the os specific clipboard
Plug 'farmergreg/vim-lastplace'                            " Intelligently reopen files where you left off

" LSP
if has('python3')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}          " LSP support for Vim & Neovim
endif
Plug 'severin-lemaignan/vim-minimap'                       " A code minimap for Vim
Plug 'chrisbra/Colorizer'                                  " A plugin to color colornames and codes
Plug 'szw/vim-tags'                                        " The Ctags generator for Vim
Plug 'airblade/vim-gitgutter'                              " A Vim plugin which shows a git diff in the gutter
Plug 'tpope/vim-fugitive'                                  " A Git wrapper so awesome, it should be illegal
Plug 'honza/vim-snippets'                                  " snipMate & UltiSnip Snippets

" UI
Plug 'psliwka/vim-smoothie'                                " Smooth scrolling for Vim done right🥤
Plug 'ryanoasis/vim-devicons'                              " Adds Icons to Your Plugins
Plug 'vim-airline/vim-airline'                             " Lean and mean status/tabline that's light as air
Plug 'edkolev/tmuxline.vim'                                " tmux statusline generator
Plug 'voldikss/vim-floaterm'                               " (Neo)vim floating/popup terminal plugin

" Themes
Plug 'lifepillar/vim-gruvbox8'

" ======> Text <======
Plug 'terryma/vim-expand-region'                           " Incremental visual selection
Plug 'michaeljsmith/vim-indent-object'                     " Text objests based on indent levels
Plug 'vim-scripts/ReplaceWithRegister'                     " Replace text with the contents of a register
" Plug 'maxbrunsfeld/vim-yankstack'                        " Plugin for storing and cycling through yanked text strings
" Plug 'vimwiki/vimwiki'                                   " A personal Wiki for Vim

" ======> Navigation <======
" Plug 'mileszs/ack.vim'                                   " Plugin that integrates ack with Vim
" Plug 'ctrlpvim/ctrlp.vim'                                " Fuzzy file, buffer, mru, tag, ... finder
Plug 'jlanzarotta/bufexplorer'                             " Buffer Explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }        " fzf ❤️ vim
Plug 'junegunn/fzf.vim'                                    " fzf ❤️ vim
" ======> Other <======

" File Types
Plug 'tpope/vim-cucumber'        , { 'for': 'cucumber' }
Plug 'pangloss/vim-javascript'   , { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown'   , { 'for': 'markdown' }
Plug 'rust-lang/rust.vim'        , { 'for': 'rust' }
Plug 'cespare/vim-toml'          , { 'for': 'toml' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" New Plugins to try
" Plug 'airblade/vim-rooter'                               " Plugin that changes to a buffer's root directory
" Plug 'junegunn/vim-emoji'                                " Emoji in Vim

call plug#end()
