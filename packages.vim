call plug#begin('$HOME/.vim/plugged')

" Core
Plug 'tommcdo/vim-lion'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-commentary'                     " Plugin for commenting code
Plug 'tpope/vim-surround'                       " Plugin for deleting, changing, and adding surroundings

" LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}        " LSP support for Vim & Neovim
Plug 'severin-lemaignan/vim-minimap'

" File Types
Plug 'tpope/vim-cucumber', { 'for': 'cucumber' }         " Filetype plugin for Cucumber
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }  " Filetype plugin for JavaScript
Plug 'plasticboy/vim-markdown'                           " Filetype plugin for Markdown
Plug 'rust-lang/rust.vim'                                " Filetype plugin for Rust
Plug 'cespare/vim-toml'                                  " Filetype plugin for TOML
Plug 'leafgarland/typescript-vim'                        " Filetype plugin for TypeScript

" ======> Text <======
Plug 'jiangmiao/auto-pairs'                     " Insert or delete brackets, parens, quotes in pair
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
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ======> Other <======
Plug 'chrisbra/Colorizer',
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'                   " A Vim plugin which shows a git diff in the gutter
Plug 'tpope/vim-fugitive'                       " A Git wrapper so awesome, it should be illegal
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'

" ======> New Plugins to try <====== 
" Plug 'airblade/vim-rooter'

" ======> Themes <======
Plug 'lifepillar/vim-gruvbox8'

call plug#end()

" ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█▀▀
" ░█░░░█░█░█░█░█▀▀░░█░░█░█░▀▀█
" ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀

" DONE
source $HOME/.vim/settings/plugins/colorizer.vim

" STRT
source $HOME/.vim/settings/plugins/which-key.vim
source $HOME/.vim/settings/plugins/floaterm.vim
source $HOME/.vim/settings/plugins/fzf.vim

" TODO
" source $HOME/.vim/settings/plugins/ack.vim
source $HOME/.vim/settings/plugins/airline.vim
source $HOME/.vim/settings/plugins/auto-pairs.vim
source $HOME/.vim/settings/plugins/buffExplorer.vim
" source $HOME/.vim/settings/plugins/coc.vim
" source $HOME/.vim/settings/plugins/ctrlp.vim
source $HOME/.vim/settings/plugins/sneak.vim
source $HOME/.vim/settings/plugins/system-copy.vim
source $HOME/.vim/settings/plugins/surround.vim
source $HOME/.vim/settings/plugins/tags.vim
source $HOME/.vim/settings/plugins/tmuxline.vim
" source $HOME/.vim/settings/plugins/vimwiki.vim
" source $HOME/.vim/settings/plugins/yankstack.vim


" ░█▄█░▀█▀░█▀▀░█▀▀░
" ░█░█░░█░░▀▀█░█░░░
" ░▀░▀░▀▀▀░▀▀▀░▀▀▀░

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

map <leader>hrp :PlugInstall --sync<cr>
