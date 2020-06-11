
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect()
filetype plugin on
syntax on

let g:tmuxline_theme = 'lightline'
let g:tmuxline_preset = 'tmux'
" Trigger Configuration for UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ultisnips_python_style = "google"
let g:UltiSnipsEditSplit="vertical"

set laststatus=2
set t_Co=256                        "Use 256 colours

"colorscheme luna-term
colorscheme palenight

" General Settings
set background=dark
set encoding=utf-8                  "UTF-8 character encoding
set mouse=a                         "Mouse support in vim
set ruler                           "Show bottom ruler
set autoindent                      "Autoindent on new lines
set textwidth=80                    "80-column text formatting
set colorcolumn=80
set conceallevel=1                  "Enable concealing charaters
set title                           "Set window title to file
set hlsearch                        "Highlight on search
set linebreak                       "Wrap long files
set nostartofline                   "Vertical movement preserves horizontal position
set number                          "Line numbers
set sidescroll=1                    "Smooth scrolling
set ttyfast                         "Speed up vim
set clipboard=unnamed               "Copy and paste from clipboard
set wildmode=longest,list           "Better unix-like tab completion
set backspace=indent,eol,start      "Better backspacing
set autoread                        "Automatically read when file is changed
set autowrite                       "Automatically write when buffer changes
set wildmenu                        "visual autocomplete for command menu
set pastetoggle=<F3>

" Tab Settings
set tabstop=4 expandtab             "4 space tabs, expand tabs to spaces
set shiftround                      "Shifts move to indent location
set rtp+=~/.fzf

"Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

"call pathogen#helptags()

" Map Key Settings
inoremap kj <Esc>
"Remap ESC key to 'kj'

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'itchyny/lightline.vim'

Plug 'sheerun/vim-polyglot'

Plug 'preservim/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'taketwo/vim-ros'

Plug 'airblade/vim-gitgutter'

call plug#end()
