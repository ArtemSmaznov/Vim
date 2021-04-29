"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Plug 'mileszs/ack.vim'                          " Plugin that integrates ack with Vim
" Plug 'ctrlpvim/ctrlp.vim'                       " Fuzzy file, buffer, mru, tag, ... finder
Plug 'jiangmiao/auto-pairs'                     " Insert or delete brackets, parens, quotes in pair
Plug 'jlanzarotta/bufexplorer'                  " Buffer Explorer
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP support for Vim & Neovim
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'godlygeek/tabular'                        " Configurable, flexible, intuitive text aligning
Plug 'terryma/vim-expand-region'                " Incremental visual selection
Plug 'airblade/vim-gitgutter'                   " A Vim plugin which shows a git diff in the gutter
Plug 'michaeljsmith/vim-indent-object'          " Text objests based on indent levels
Plug 'farmergreg/vim-lastplace'                 " Intelligently reopen files where you left off
" Plug 'maxbrunsfeld/vim-yankstack'               " Plugin for storing and cycling through yanked text strings
Plug 'tpope/vim-fugitive'                       " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-surround'                       " Plugin for deleting, changing, and adding surroundings
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'                     " Plugin for commenting code
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-system-copy'
Plug 'liuchengxu/vim-which-key'
Plug 'ryanoasis/vim-devicons' 
Plug 'chrisbra/Colorizer',
Plug 'justinmk/vim-sneak'
Plug 'severin-lemaignan/vim-minimap'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Support
Plug 'tpope/vim-cucumber'                       " Filetype plugin for Cucumber
Plug 'pangloss/vim-javascript'                  " Filetype plugin for JavaScript
Plug 'leafgarland/typescript-vim'               " Filetype plugin for TypeScript
" Plug 'rust-lang/rust.vim'                       " Filetype plugin for Rust
Plug 'plasticboy/vim-markdown'                  " Vim Markdown

" Color Schemes
Plug 'lifepillar/vim-gruvbox8'

" New Plugins to try
" Plug 'airblade/vim-rooter'


call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source ~/.vim/settings/plugins/ack.vim
source ~/.vim/settings/plugins/airline.vim
source ~/.vim/settings/plugins/auto-pairs.vim
source ~/.vim/settings/plugins/buffExplorer.vim
source ~/.vim/settings/plugins/coc.vim
source ~/.vim/settings/plugins/colorizer.vim
source ~/.vim/settings/plugins/commentary.vim
" source ~/.vim/settings/plugins/ctrlp.vim 
source ~/.vim/settings/plugins/fzf.vim 
source ~/.vim/settings/plugins/gitGutter.vim
source ~/.vim/settings/plugins/minimap.vim
source ~/.vim/settings/plugins/sneak.vim
source ~/.vim/settings/plugins/system-copy.vim
source ~/.vim/settings/plugins/surround.vim
source ~/.vim/settings/plugins/tabularize.vim
source ~/.vim/settings/plugins/tmuxline.vim
source ~/.vim/settings/plugins/which-key.vim
" source ~/.vim/settings/plugins/yankstack.vim


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ep :e! ~/.vim/settings/plugins.vim<cr>
autocmd! bufwritepost ~/.vim/settings/plugins.vim source ~/.vim/settings/plugins.vim
