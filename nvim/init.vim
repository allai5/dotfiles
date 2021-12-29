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
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'github/copilot.vim'

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

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyls'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
EOF

lua <<EOF
on_attach = function(client)
    apply_settings()
    lsp_status.on_attach(client)
    vim.api.nvim_buf_set_keymap(0, 'n', 'gs', '<Cmd>ClangdSwitchSourceHeader<CR>', {noremap=true, silent=true})
end
EOF

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
