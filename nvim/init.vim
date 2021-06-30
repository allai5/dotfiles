filetype plugin on
syntax on

let g:tmuxline_theme = 'lightline'
let g:tmuxline_preset = 'tmux'
" Trigger Configuration for UltiSnips
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:ultisnips_python_style = "google"
"let g:UltiSnipsEditSplit="vertical"
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

let g:tex_flavor = 'latex'
let g:ale_sign_column_always=1 " Always show the sign column for sanity
let g:airline#extensions#ale#enabled=1 " Enable ALE integration in airline
let g:ale_fixers={ 'cpp': ['clang-format'], 'python': ['black'], }
let g:ale_c_clangformat_options='-style=Google'
let g:ale_c_parse_compile_commands=1
let g:ale_python_black_options='-l 80'
let g:ale_fix_on_save = 1

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

set laststatus=2
set t_Co=256                        "Use 256 colours

colorscheme onedark

" General Settings
set background=dark
set encoding=utf-8                  "UTF-8 character encoding
set mouse=a                         "Mouse support in vim
set ruler                           "Show bottom ruler
set autoindent                      "Autoindent on new lines
set textwidth=80                    "80-column text formatting
set colorcolumn=80
set conceallevel=0                  "Don't Enable concealing charaters
set title                           "Set window title to file
set hlsearch                        "Highlight on search
set linebreak                       "Wrap long files
set nostartofline                   "Vertical movement preserves horizontal position
set number                          "Line numbers
set relativenumber
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
set ts=4 sw=4
set shiftround                      "Shifts move to indent location
set rtp+=~/.fzf

"Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e
autocmd VimEnter * RainbowParentheses
"call pathogen#helptags()


" Map Key Settings
inoremap kj <Esc>
"Remap ESC key to 'kj'

call plug#begin('~/.config/nvim/plugged')

"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
"Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :files<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>p :GFiles<CR>

"Plug 'justmao945/vim-clang'

call plug#end()
call vimtex#init()

let g:vimtex_quickfix_autoclose_after_keystrokes = 2
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_enabled = 1
let g:tex_flavor = 'latex'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

lua << EOF
require'lspconfig'.pyls.setup{}
require'lspconfig'.clangd.setup{}
EOF

"lua << EOF
"require'lspconfig'.clangd.setup{}
"EOF

"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
